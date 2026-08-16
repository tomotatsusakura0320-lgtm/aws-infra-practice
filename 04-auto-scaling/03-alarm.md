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

スケールアウト前の2台のEC2インスタンスにSSMで接続し、nprocコマンドでCPUコア数を確認した後、それぞれでyes > /dev/null &コマンドを実行してCPU負荷をかけ、スケールアウトの動作を検証した。

![yes-a](./images/04-yes-a.png)
![top-a](./images/04-top-a.png)

![yes-b](./images/04-yes-b.png)
![top-b](./images/04-top-b.png)
