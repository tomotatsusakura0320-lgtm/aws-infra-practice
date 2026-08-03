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
## LatestAMIId
AWS Systems Manager パラメータストアの公開パラメータを利用し、最新の Amazon Linux 2023 AMI を自動取得しています。

## EnableNatGateway
NAT Gateway の作成有無を切り替えるためのパラメータです。

## EnableCloudWatch
CloudWatch Logs 関連リソースの作成有無を切り替えるためのパラメータです。


---
## Conditions

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

## CreateNatGateway
EnableNatGateway パラメータが "true" の場合のみ、NAT Gateway関連のリソースを作成します。

## CreateCloudWatch
EnableNatGateway と EnableCloudWatch の両方が "true" の場合のみ、CloudWatch Logs関連のリソースを作成します。

---
## IAM Role

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
                - arn:aws:s3:::example-web-lab-s3-bucket
                - arn:aws:s3:::example-web-lab-s3-bucket/*
