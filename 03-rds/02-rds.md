## RDSサブネットグループ作成

IAMロール `rds-lab-ec2-role` を作成し、ポリシー(`AmazonSSMManagedInstanceCore`,`CloudWatchAgentServerPolicy`)をアタッチしました。

## RDS作成
EC2インスタンスを以下の設定で作成し、パブリックサブネット(`rds-lab-public-subnet-a`)に配置しました。

- マシンイメージ：Amazon Linux 2023
- インスタンスタイプ：t3.micro
- キーペア：あり
- セキュリティグループ：`rds-lab-sg-ec2`
- IAMロール：`rds-lab-ec2-role`

## CREATE
SSM接続後、MySQLに接続しました

```bash
mysql -h rds-lab-rds.xxxxxxxxx.ap-northeast-1.rds.amazonaws.com -P 3306 -u xxxx -p
```
データベースを作成しました

```sql
CREATE DATABASE portfolio_db;
USE portfolio_db;
```
