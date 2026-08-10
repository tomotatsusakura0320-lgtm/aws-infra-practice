## ネットワーク作成

構成図に従って、以下のリソースを作成しました。

- VPC
- サブネット
- インターネットゲートウェイ
- ルートテーブル

## セキュリティグループ作成

Webサーバ用セキュリティグループ `rds-lab-sg-ec2` を作成し、SSH(22)を自IPからのみ許可しました。

DB用セキュリティグループ `rds-lab-sg-rds` を作成し、MYSQL/Aurora(3306)を `rds-lab-sg-ec2` からのみ許可しました。

## IAMロール作成

IAMロール `rds-lab-ec2-role` を作成し、ポリシー(`AmazonSSMManagedInstanceCore`,`SecretsManagerReadWrite`)をアタッチしました。

## EC2作成

EC2インスタンスを以下の設定で作成し、パブリックサブネット(`rds-lab-public-subnet-a`)に配置しました。

- マシンイメージ：Amazon Linux 2023
- インスタンスタイプ：t3.micro
- キーペア：あり
- セキュリティグループ：`rds-lab-sg-ec2`
- IAMロール：`rds-lab-ec2-role`
