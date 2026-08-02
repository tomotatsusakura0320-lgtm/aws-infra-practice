# CloudFormationによるALBを利用した高可用性Webシステム

---
## 概要

01-albでコンソールから構築したWebシステムと同じものを、AWS CloudFormationを利用して自動構築できるようにしました。

VPC、サブネット、ルートテーブル、NAT Gateway、Application Load Balancer(ALB)、EC2、IAMロールなどのAWSリソースをテンプレートとして定義し、同等の構成を再現できます。

また、EC2起動時にはUserDataを利用してnginxおよびCloudWatch Agentのインストール・設定を自動化しています。

CloudWatch Agentの設定はSystems Manager Parameter Storeから取得し、WebコンテンツはAmazon S3から取得することで、設定やコンテンツをCloudFormationテンプレートから分離しています。

---
## 構築手順

- [01. 事前準備](01-prerequisites.md)
- [02. CloudFormationテンプレート](02-cloudformation-template.md)
- [03. デプロイ・動作確認](03-deploy-verification.md)
- [04. リソース削除](04-cleanup.md)
