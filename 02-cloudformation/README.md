# CloudFormationによるALBを利用した高可用性Webシステム

## 概要

01-albでコンソールから構築したWebシステムと同じものを、AWS CloudFormationを利用して自動構築できるようにしました。

VPC、サブネット、ルートテーブル、NAT Gateway、Application Load Balancer(ALB)、EC2、IAMロールなどのAWSリソースをテンプレートとして定義し、同等の構成を再現できます。

また、EC2起動時にはUserDataを利用してnginxおよびCloudWatch Agentのインストール・設定を自動化しています。

CloudWatch Agentの設定はSystems Manager Parameter Storeから取得し、WebコンテンツはAmazon S3から取得することで、設定やコンテンツをCloudFormationテンプレートから分離しています。

## 構築手順
01. CloudFormationテンプレート作成
02. 事前準備（Parameter Store・S3など）
03. CloudFormationデプロイ
04. 動作確認
05. リソース削除
