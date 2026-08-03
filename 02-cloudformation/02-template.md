## テンプレート概要

本環境はCloudFormationにより以下のリソースを自動構築します。

VPC
Public/Private Subnet
ALB
Target Group
EC2 ×2
IAM Role
Security Group

テンプレート全文は template.yaml にあります。

---
## Parameters

### LatestAMIId
AWS Systems Manager パラメータストアの公開パラメータを利用し、最新の Amazon Linux 2023 AMI を自動取得しています。

### EnableNatGateway
NAT Gateway の作成有無を切り替えるためのパラメータです。

### EnableCloudWatch
CloudWatch Logs 関連リソースの作成有無を切り替えるためのパラメータです。

```yaml
Parameters:
  LatestAMIId:
    Type: AWS::SSM::Parameter::Value<AWS::EC2::Image::Id>
    Default: /aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64
    Description: Latest Amazon Linux 2023 AMI

  EnableNatGateway:
    Type: String
    Default: "false"
    AllowedValues:
      - "true"
      - "false"
    Description: Enable NAT Gateway

  EnableCloudWatch:
    Type: String
    Default: "false"
    AllowedValues:
      - "true"
      - "false"
    Description: Enable CloudWatch Agent
```

---
## Conditions

### CreateNatGateway
EnableNatGateway パラメータが "true" の場合のみ、NAT Gateway関連のリソースを作成します。

### CreateCloudWatch
EnableNatGateway と EnableCloudWatch の両方が "true" の場合のみ、CloudWatch Logs関連のリソースを作成します。

```yaml
Conditions:
  CreateNatGateway:
    Fn::Equals:
      - !Ref EnableNatGateway
      - "true"

  CreateCloudWatch:
    Fn::And:
      - Fn::Equals:
          - !Ref EnableNatGateway
          - "true"
      - Fn::Equals:
          - !Ref EnableCloudWatch
          - "true"
```

---
## IAM Role

EC2インスタンスにIAMロールを割り当て、Systems Managerによる接続、CloudWatch Agentによるログ送信、およびS3からWebコンテンツを取得するための権限を付与しています。

```yaml
WebServerRole:
  Type: AWS::IAM::Role
  Properties:
    AssumeRolePolicyDocument:
      Statement:
        - Effect: Allow
          Principal:
            Service:
              - ec2.amazonaws.com
          Action:
            - sts:AssumeRole

    ManagedPolicyArns:
      - arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore
      - arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy

    Policies:
      - PolicyName: S3ReadIndexHtmlPolicy
        PolicyDocument:
          Statement:
            - Effect: Allow
              Action:
                - s3:ListBucket
                - s3:GetObject
              Resource:
                - arn:aws:s3:::example-web-lab-s3-example-bucket
                - arn:aws:s3:::example-web-lab-s3-example-bucket/*
```

## EC2

```yaml
  WebServerInstanceA:
    Type: AWS::EC2::Instance
    Properties:
      ImageId: !Ref LatestAMIId
      InstanceType: t3.micro
      SubnetId: !Ref PrivateSubnetA
      SecurityGroupIds:
        - !Ref WebSecurityGroup
      IamInstanceProfile: !Ref WebServerInstanceProfile
      UserData:
        !Base64 |
          #!/bin/bash
          dnf update -y
          dnf install -y nginx
          aws s3 cp \
            s3://web-lab-s3-tenten-20260802/server-a/index.html \
            /usr/share/nginx/html/index.html
          systemctl enable nginx
          systemctl start nginx
          dnf install -y amazon-cloudwatch-agent
          systemctl enable amazon-cloudwatch-agent
          /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
            -a fetch-config \
            -m ec2 \
            -c ssm:/web-lab/cloudwatch-agent/config \
            -s
      Tags:
        - Key: Name
          Value: cfn-web-lab-web-ec2-a
```
