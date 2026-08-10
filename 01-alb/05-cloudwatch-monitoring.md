## CloudWatch確認

ロググループ `/aws/ec2/nginx/access` に2つのEC2インスタンスのログストリームが存在することを確認しました。

![アクセスロググループ](./images/01-access-log-group.png)

---

ロググループ `/aws/ec2/nginx/error` に2つのEC2インスタンスのログストリームが存在することを確認しました。

![エラーロググループ](./images/01-error-log-group.png)

---

CloudWatch Metricsから、EC2インスタンスのCPU使用状況を確認しました。

![メトリクス](./images/01-metrics.png)

