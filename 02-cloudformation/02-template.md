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
AMI IDをテンプレートへ固定で記述しないため、最新のAMIを利用できるほか、テンプレートの保守性も向上します。
## EnableNatGateway
NAT Gateway の作成有無を切り替えるためのパラメータです。
true を指定すると NAT Gateway を作成し、false の場合は作成しません。
Conditions と組み合わせることで、用途に応じてコストを抑えた構成と高可用性構成を切り替えられるようにしています。
## EnableCloudWatch
CloudWatch Logs 関連リソースの作成有無を切り替えるためのパラメータです。
検証内容に応じてログ収集機能を有効・無効にできるようにしています。
Conditions を利用して必要な場合のみリソースを作成する構成としています。

