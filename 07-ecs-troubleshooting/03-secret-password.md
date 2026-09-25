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

エラーコード1045が発生していることから、DB接続時の認証に失敗していることを確認しました。

## 復旧
Secrets Manager の `DB_PASSWORD` を正しい値に戻し、再デプロイしました。

---
ヘルスステータスがhealthyになっていることを確認しました。
![ターゲットグループ1after](./images/07-03-ecs-rds-lab-tg-1-after.png)
![ターゲットグループ2after](./images/07-03-ecs-rds-lab-tg-2-after.png)

---
ブラウザからも正常にアクセスできることを確認しました。
![ブラウザafter](./images/07-03-browser-after.png)

