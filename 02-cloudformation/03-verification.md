## 検証

スタックが作成されていることを確認しました。
![スタック画面](./images/02-web-lab-stack.png)

---
EC2インスタンスが作成されていることを確認しました。
![EC2画面](./images/02-cfn-web-lab-web-ec2-a.png)
![EC2画面](./images/02-cfn-web-lab-web-ec2-c.png)

---
ALBが作成されて、ターゲットグループが正常に登録されていることを確認しました。
![ALB画面](./images/02-cfn-web-lab-alb.png)
![ALB画面](./images/02-cfn-web-lab-alb-1.png)
![ターゲットグループ画面](./images/02-cfn-web-lab-tg.png)

---
ウェブブラウザからNgninxのトップページにアクセスできることと、ページ再読み込みによってインスタンスが切り替わることを確認しました。
![ウェブブラウザ画面](./images/02-nginx-toppage-a.png)
![ウェブブラウザ画面](./images/02-nginx-toppage-c.png)

---
ロググループを確認し、ログストリームが2つのインスタンスそれぞれに対して作成されていることを確認しました。
![ロググループ画面](./images/02-log-group.png)
![アクセスログ画面](./images/02-access-log.png)
![エラーログ画面](./images/02-error-log.png)
