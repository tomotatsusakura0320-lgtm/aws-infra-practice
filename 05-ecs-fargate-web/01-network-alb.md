## ネットワーク作成

構成図に従って、以下のリソースを作成しました。

- VPC
- サブネット
- インターネットゲートウェイ
- ルートテーブル
- NATゲートウェイ

## セキュリティグループ作成

ALB用セキュリティグループ `ecs-rds-lab-alb-sg` を作成し、インバウンドルールとしてHTTP(80)のみ許可しました。

ECS用セキュリティグループ `ecs-rds-lab-ecs-sg` を作成し、インバウンドルールとしてHTTP(80)を `ecs-rds-lab-alb-sg` からのみ許可しました。

## ターゲットグループ作成

ターゲットグループ `ecs-rds-lab-tg` を以下の設定で作成しました。

- VPC: `ecs-rds-lab-vpc`
- プロトコル: HTTP(80)
- ターゲットの種類: IP


## ALB作成

ALB `ecs-rds-lab-alb` を以下の設定で作成しました。

- VPC: `ecs-rds-lab-vpc`
- サブネット: `ecs-rds-lab-public-subnet-a`, `ecs-rds-lab-public-subnet-c`
- セキュリティグループ: `ecs-rds-lab-alb-sg`
- プロトコル: HTTP(80)
- 転送先ターゲットグループ: `ecs-rds-lab-tg`
- ターゲットグループの維持:　オン
