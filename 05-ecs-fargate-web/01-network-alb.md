## ネットワーク作成

構成図に従って、以下のリソースを作成しました。

- VPC
- サブネット
- インターネットゲートウェイ
- ルートテーブル
- NATゲートウェイ

## セキュリティグループ作成

ALB用セキュリティグループ `web-lab-alb-sg` を作成し、インバウンドルールとしてHTTP(80)のみ許可しました。

ECS用セキュリティグループ `web-lab-ecs-fargate-sg` を作成し、インバウンドルールとしてHTTP(80)を `web-lab-alb-sg` からのみ許可しました。

## ターゲットグループ作成

ターゲットグループ `web-lab-tg-ecs-fargate` を以下の設定で作成しました。

- VPC: `web-lab-vpc`
- プロトコル: HTTP(80)
- ターゲットの種類: IP


## ALB作成

ALB `web-lab-alb` を以下の設定で作成しました。

- VPC: `web-lab-vpc`
- サブネット: `web-lab-public-subnet-a`, `web-lab-public-subnet-c`
- セキュリティグループ: `web-lab-alb-sg`
- プロトコル: HTTP(80)
- 転送先ターゲットグループ: `web-lab-tg-ecs-fargate`
- ターゲットグループの維持:　オン
