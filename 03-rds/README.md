# Amazon RDSを利用したデータベース環境の構築

## 概要

AWS上にAmazon RDS for MySQLを利用したデータベース環境を構築しました。

EC2からRDSへ接続できる構成を作成し、Security GroupによってRDSへのMySQL接続をEC2からの通信に限定しました。

また、RDS上でデータベース・テーブルの作成、データの追加・削除を行いました。

さらに、RDSのSnapshotによるバックアップとリストア、DB Parameter Groupによるデータベース設定の変更、AWS Secrets ManagerとIAM Roleを利用したデータベース認証情報の管理を実施しました。


## 構成図

![構成図](./images/03-kouseizu.png)

## 構築手順

- [01. ネットワーク・EC2構築](01-network-ec2.md)
- [02. RDS](02-rds.md)
- [03. スナップショットを利用した復元](03-snapshot.md)
- [04. Parameter-group作成](04-parameter-group.md)
- [05. Secret作成](05-secrets-manager.md)
- [06. リソース削除](06-cleanup.md)

