## SNSトピック作成

SNSトピックとサブスクリプションを作成し、AWSから送信された確認メールのリンクをクリックしてサブスクリプションを確認しました。

![SNSトピック](./images/04-web-lab-sns-alert.png)

## アラーム作成

スケールアウト用のCloudWatch Alarmを作成し、CPU使用率90%以上を2回中2回検知するよう設定しました。

![スケールアウト用アラームa](./images/04-web-lab-scale-out-alarm-a.png)

スケールイン用のCloudWatch Alarmを作成し、CPU使用率30％以下を2回中2回検知するよう設定しました。

![スケールイン用アラームa](./images/04-web-lab-scale-in-alarm-a.png)

## Auto Scaling Policy作成

スケールアウト用のCloudWatch Alarmをトリガーとして、EC2インスタンスを2台追加するAuto Scalingポリシーを作成しました。

スケールイン用のCloudWatch Alarmをトリガーとして、EC2インスタンスを2台削除するAuto Scalingポリシーを作成しました。

![Auto Scaling Policy](./images/04-web-lab-auto-scaling-policy.png)

## Auto Scalingのスケールアウト検証

スケールアウト前の2台のEC2インスタンスにSSMで接続し、nprocコマンドでCPUコア数を確認した後、それぞれでyes > /dev/null &コマンドを実行してCPU負荷をかけました。

![yesコマンドa](./images/04-yes-a.png)
![topコマンドa](./images/04-top-a.png)
![yesコマンドb](./images/04-yes-b.png)
![topコマンドb](./images/04-top-b.png)

---
スケールアウト用アラームがアラーム状態になり、スケールイン用アラームがOK状態になることを確認しました。

![スケールアウト用アラームb](./images/04-web-lab-scale-out-alarm-b.png)
![スケールアウト用アラームb](./images/04-web-lab-scale-in-alarm-b.png)

---
スケールアウト用アラームがアラーム状態になったことを知らせる、SNSトピックのサブスクリプションから送信されたメールを確認しました。

![スケールアウト通知メール](./images/04-scale-out-alarm-email.png)

---
ターゲットグループに2台の新たなインスタンスが追加され、ヘルスチェックで正常になることを確認しました。

![スケールアウト後ターゲットグループ1](./images/04-scale-out-alarm-email.png)
![scale-out-email](./images/04-scale-out-alarm-email.png)
