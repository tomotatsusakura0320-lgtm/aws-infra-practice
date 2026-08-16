## SNSトピック作成

SNSトピックとサブスクリプションを作成し、AWSから送信された確認メールのリンクをクリックしてサブスクリプションを確認しました。

![SNSトピック](./images/04-web-lab-sns-alert.png)

## アラーム作成

スケールアウト用のCloudWatch Alarmを作成し、CPU使用率90%以上を2回中2回検知するよう設定しました。

![スケールアウト用アラームa](./images/04-web-lab-scale-out-alarm-a.png)

スケールイン用のCloudWatch Alarmを作成し、CPU使用率30％以下を2回中2回検知するよう設定しました。

![スケールイン用アラームa](./images/04-web-lab-scale-in-alarm-a.png)
