# ALBを利用した高可用性Webシステム

## 概要
AWS上に高可用性を意識したWebサーバ環境を構築しました。

2つのAZに配置したEC2上でnginxを稼働させ、
Application Load Balancer(ALB)を経由してブラウザからアクセスできる構成を作成しました。

また、EC2はプライベートサブネットに配置し、
Systems Manager Session Manager(SSM)を利用して管理を行いました。

## 構成図

![構成図](AWS-Practice-01.png)

---

## システム構成

- VPC
- Public Subnet ×2
- Private Subnet ×2
- ALB
- EC2 ×2
- NAT Gateway ×2
- Session Manager

---

## 構築手順

1. VPC・Subnet作成
2. Internet Gateway作成
3. NAT Gateway作成
4. Route Table設定
5. Security Group作成
6. IAM Role作成
7. EC2起動
8. ALB・Target Group作成
9. SSM接続確認
10. nginxインストール・動作確認
11. CloudWatch Agentインストール・設定
12. CloudWatch Logs・Metrics確認
13. S3へログ保存設定
14. ブラウザから動作確認
15. リソース削除
