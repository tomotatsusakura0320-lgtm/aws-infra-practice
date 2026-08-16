## 起動テンプレート作成

起動テンプレート `web-lab-launch-template` を以下の設定で作成しました。

- AMI: Amazon Linux 2023
- インスタンスタイプ: t3.micro
- キーペア: なし
- サブネット: `web-lab-private-subnet-a`, `web-lab-private-subnet-c`
- アベイラビリティゾーン: ap-northeast-1a, ap-northeast-1c
- セキュリティグループ: `web-lab-web-sg`
- IAMインスタンスプロフィール: `web-lab-web-ec2-role`
- ユーザーデータ: 
