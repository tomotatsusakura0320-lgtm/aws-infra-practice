## ALB作成

![ALB設定](./images/01-web-lab-alb.png)
![ALB設定](./01-web-lab-alb-1.png)

ALBを作成し、2つのリージョンにあるec2インスタンスで負荷分散ができるようにしました。

---
## ターゲットグループ作成

![ターゲットグループ設定](./01-web-lab-tg.png)
![ターゲットグループ設定](./01-web-lab-tg-1.png)
ターゲットグループを作成し、２つのec2インスタンス(web-lab-web-ec2-a/web-lab-web-ec2-c)を追加しました。
