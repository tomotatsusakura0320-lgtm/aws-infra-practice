## SNSトピック作成

SNSトピックとサブスクリプションを作成し、AWSから送信された確認メールのリンクをクリックしてサブスクリプションを確認しました。

![SNSトピック](./images/04-web-lab-sns-alert.png)

## アラーム作成

スケールアウト用のCloudWatch Alarm `web-lab-scale-out-alarm` を作成し、CPU使用率90%以上を2回中2回検知するよう設定しました。

![スケールアウト用アラームa](./images/04-web-lab-scale-out-alarm-a.png)

スケールイン用のCloudWatch Alarm `web-lab-scale-in-alarm` を作成し、CPU使用率30％以下を2回中2回検知するよう設定しました。

![スケールイン用アラームa](./images/04-web-lab-scale-in-alarm-a.png)

## Auto Scaling Policy作成

`web-lab-scale-out-alarm` をトリガーとして、EC2インスタンスを2台追加するAuto Scalingポリシーを作成しました。

`web-lab-scale-in-alarm` をトリガーとして、EC2インスタンスを2台削除するAuto Scalingポリシーを作成しました。

![Auto Scaling Policy](./images/04-web-lab-auto-scaling-policy.png)

## Auto Scalingのスケールアウト検証

スケールアウト前の2台のEC2インスタンスにSSMで接続し、nprocコマンドでCPUコア数を確認した後、それぞれでyes > /dev/null &コマンドを実行してCPU負荷をかけました。

![yesコマンドa](./images/04-yes-a.png)
![topコマンドa](./images/04-top-a.png)
![yesコマンドb](./images/04-yes-b.png)
![topコマンドb](./images/04-top-b.png)

---
`web-lab-scale-out-alarm` がアラーム状態になり、`web-lab-scale-in-alarm` がOK状態になることを確認しました。

![スケールアウト用アラームb](./images/04-web-lab-scale-out-alarm-b.png)
![スケールイン用アラームb](./images/04-web-lab-scale-in-alarm-b.png)

---
`web-lab-scale-out-alarm` がアラーム状態になったことを知らせる、SNSトピックのサブスクリプションから送信されたメールを確認しました。

![スケールアウト通知メール](./images/04-scale-out-alarm-email.png)

---
ターゲットグループに2台の新たなインスタンスが追加され、ヘルスチェックで正常になることを確認しました。

![スケールアウト後ターゲットグループ1](./images/04-web-lab-tg-b-1.png)
![スケールアウト後ターゲットグループ2](./images/04-web-lab-tg-b-2.png)

---
ウェブブラウザからALBのDNS名にアクセスし、ページを更新することで新たに追加された2台のEC2インスタンスのインスタンスIDがそれぞれ表示されることを確認しました。

![Nginx Top C](./images/04-nginx-top-c.png)
![Nginx Top D](./images/04-nginx-top-d.png)

---
`pkill yes` コマンドを実行し、yesプロセスを終了しました。その後、`web-lab-scale-in-alarm` がアラーム状態になることを確認しました。

![スケールイン用アラームb](./images/04-web-lab-scale-in-alarm-c.png)

---
ターゲットグループから2台のインスタンスが削除されたことを確認しました。

![スケールイン後ターゲットグループ1](./images/04-web-lab-tg-c-1.png)
![スケールイン後ターゲットグループ2](./images/04-web-lab-tg-c-2.png)

---
Cloudwatch Alarmの推移

![スケールアウト用アラームのグラフ](./images/04-web-lab-scale-out-alarm-g.png)
![スケールイン用アラームのグラフ](./images/04-web-lab-scale-in-alarm-g.png)
