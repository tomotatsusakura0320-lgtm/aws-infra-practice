# Secretに保存しているパスワードの値を変更し、ＤＢ接続エラーを発生させる

## Secretの変更
Secrets Manager の `DB_PASSWORD` の値を実際のRDS接続に使用しているパスワードとは異なる値に変更し、DB接続エラーが発生する状態にしました。

![エラーメッセージ](./images/07-03-ecs-rds-lab-cluster-error.png)
![ターゲットグループ1before](./images/07-03-ecs-rds-lab-tg-1-before.png)
![ターゲットグループ2before](./images/07-03-ecs-rds-lab-tg-2-before.png)

---
ブラウザからもアクセスできないことを確認しました。
![ブラウザbefore](./images/07-03-browser-before.png)

## 原因の特定
Cloudwatch Logs でログを確認しました。

![ログbefore](./images/07-03-cloudwatch-logs.png)

**エラーコード1045**が発生していることから、DB接続時の認証に失敗していることを確認しました。

---
一時的に作成したEC2インスタンスからRDSへ接続し、以下のコマンドを実行しました。正しいパスワードを入力したところ、正常にログインできることを確認しました。
```bash
mysql -h <RDSエンドポイント> -P 3306 -u <ユーザー名> -p
```
## 復旧
Secrets Manager の `DB_PASSWORD` を正しい値に戻し、再デプロイしました。

---
ヘルスステータスが**Healthy**になっていることを確認しました。
![ターゲットグループ1after](./images/07-03-ecs-rds-lab-tg-1-after.png)
![ターゲットグループ2after](./images/07-03-ecs-rds-lab-tg-2-after.png)

---
ブラウザからも正常にアクセスできることを確認しました。
![ブラウザafter](./images/07-03-browser-after.png)

