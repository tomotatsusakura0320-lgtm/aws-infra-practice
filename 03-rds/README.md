# Amazon RDSを利用したデータベース環境

## 概要

AWS上にAmazon RDS for MySQLを利用したデータベース環境を構築しました。

EC2からRDSへ接続できる構成を作成し、Security GroupによってRDSへのMySQL接続をEC2からの通信に限定しました。

また、RDS上でデータベース・テーブルの作成、データの追加・削除を行いました。

さらに、RDSのSnapshotによるバックアップとリストア、DB Parameter Groupによるデータベース設定の変更、AWS Secrets ManagerとIAM Roleを利用したデータベース認証情報の管理を実施しました。


## 構成図

![構成図](./images/03-kouseizu.png)
