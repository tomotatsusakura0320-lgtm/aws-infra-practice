## CloudWatch確認

![アクセスロググループ](./images/01-access-log-group.png)
ロググループ /aws/ec2/nginx/access に2つのEC2インスタンスのログストリームが存在することを確認しました。

![エラーロググループ](./images/01-error-log-group.png)
ロググループ /aws/ec2/nginx/error に2つのEC2インスタンスのログストリームが存在することを確認しました。

![メトリクス](./images/01-metrics.png)
CloudWatch Metricsから、EC2インスタンスのCPU使用状況を確認しました。
