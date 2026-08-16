## ネットワーク作成

構成図に従って、以下のリソースを作成しました。

- VPC
- サブネット
- インターネットゲートウェイ
- ルートテーブル
- NATゲートウェイ

## セキュリティグループ作成

ALB用セキュリティグループ `web-lab-alb-sg` を作成し、HTTP(80)とHTTPS(443)を許可しました。

Webサーバ用セキュリティグループ `web-lab-web-sg` を作成し、HTTP(80)とHTTPS(443)は `web-lab-alb-sg` からのみ許可しました。

## IAMロール作成

IAMロール ` web-lab-web-ec2-role` を作成し、ポリシー(`AmazonSSMManagedInstanceCore`,`CloudWatchAgentServerPolicy`)をアタッチしました。

## ターゲットグループ作成

ターゲットグループ `web-lab-tg` を以下の設定で作成しました。

- VPC: `web-lab-vpc`
- プロトコル: HTTP(80)

## ALB作成

ALB `web-lab-alb` を以下の設定で作成しました。

- VPC: `web-lab-vpc`
- サブネット: `web-lab-public-subnet-a`, `web-lab-public-subnet-c`
- セキュリティグループ: `web-lab-alb-sg`
- プロトコル: HTTP(80)
- 転送先ターゲットグループ: `web-lab-tg`
- ターゲットグループの維持:　オン
