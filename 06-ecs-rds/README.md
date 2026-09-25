# Amazon ECS FargateとAmazon RDSを利用したコンテナWebシステムの構築

## 概要

AWS上にAmazon ECS FargateとAmazon RDS for MySQLを利用したコンテナWebシステムを構築しました。

DockerでFlaskアプリケーションをコンテナ化し、Amazon ECRに登録したDockerイメージをECS Fargate上で実行しました。また、Application Load Balancer（ALB）をECS Serviceと連携し、Public Subnet上のALBからPrivate Subnet上の複数のTaskへリクエストを転送する構成としました。

さらに、ECS Fargate上のFlaskアプリケーションからPrivate Subnet上のRDS MySQLへ接続し、データベースから取得したデータをブラウザに表示できることを確認しました。DB接続情報にはSecrets Managerを利用し、CloudWatch Logsによるログ確認を行いました。

- [01. ネットワーク・ALB構築](01-network-alb.md)
- [02. ローカルでの動作確認・リポジトリ作成](02-local-ecr.md)
- [03. RDSの作成・テーブルの作成](03-rds.md)
- [04. ECSの作成・動作確認](04-ecs.md)

## 構成図

![構成図](./images/06-kouseizu.png)
