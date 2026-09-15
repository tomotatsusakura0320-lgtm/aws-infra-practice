## ネットワーク作成

構成図に従って、以下のリソースを作成しました。

- VPC
- サブネット
- インターネットゲートウェイ
- ルートテーブル
- NATゲートウェイ

## セキュリティグループ作成

ALB用セキュリティグループ `ecs-rds-lab-alb-sg` を作成し、インバウンドルールとしてHTTP(80)を許可しました。

ECS用セキュリティグループ `ecs-rds-lab-ecs-sg` を作成し、インバウンドルールとしてHTTP用ポート(5000)を `ecs-rds-lab-alb-sg` からのみ許可しました。

RDS用セキュリティグループ `ecs-rds-lab-rds-sg` を作成し、インバウンドルールとしてMysql用ポート(3306)を `ecs-rds-lab-ecs-sg` からのみ許可しました。


## ターゲットグループ作成

ターゲットグループ `ecs-rds-lab-tg` を以下の設定で作成しました。

- VPC: `ecs-rds-lab-vpc`
- プロトコル: HTTP(5000)
- ターゲットの種類: IP


## ALB作成

ALB `ecs-rds-lab-alb` を以下の設定で作成しました。

- VPC: `ecs-rds-lab-vpc`
- サブネット: `ecs-rds-lab-public-subnet-a`, `ecs-rds-lab-public-subnet-c`
- セキュリティグループ: `ecs-rds-lab-alb-sg`
- プロトコル: HTTP(80)
- 転送先ターゲットグループ: `ecs-rds-lab-tg`
- ターゲットグループの維持:　オン
