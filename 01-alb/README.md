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

1. VPC作成
2. Public / Private Subnet作成
3. Internet Gateway設定
4. NAT Gateway作成
5. Route Table設定
6. EC2作成
7. IAM Role設定
8. SSM接続確認
9. nginxインストール
10. ALB作成
11. Target Group登録
12. 動作確認
