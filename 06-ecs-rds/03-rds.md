## RDSサブネットグループ作成
サブネットグループを作成しました。

![サブネットグループ](./images/03-rds-lab-subnet-group.png)

## RDS作成
RDSを作成しました。

![RDS1](./images/03-rds-lab-rds.png)
![RDS2](./images/03-rds-lab-rds-1.png)

## Secretの作成
RDSへの接続情報をSecrets Managerで管理し、ECS Taskから取得してDB接続に利用するため、以下のキーと値をSecretに保存しました。
なお、値についてはセキュリティ上の理由から記載していません。

- DB_HOST
- DB_PORT
- DB_NAME
- DB_USER
- DB_PASSWORD


## EC2インスタンスから接続
`ecs-rds-lab-public-subnet-a` 上にEC2インスタンスを作成しました。
`ecs-rds-lab-rds-sg` にEC2インスタンスにアタッチしたセキュリティグループからの通信を許可するインバウンドルールを追加しました。

