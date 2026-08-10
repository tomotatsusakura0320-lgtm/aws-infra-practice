## Secret作成
Secretを作成し、認証情報を入力しました。

![クレデンシャル画面1](./images/03-rds-lab-rds-credentials.png)
![クレデンシャル画面2](./images/03-rds-lab-credentials-value.png)

## 確認
EC2へSSM接続し、Secretの内容が表示されることを確認しました。

```bash
aws secretsmanager get-secret-value \
  --secret-id rds-lab-rds-credentials \
  --query SecretString \
  --output text
```

![クレデンシャル確認画面](./images/03-get-secret-value.png)
