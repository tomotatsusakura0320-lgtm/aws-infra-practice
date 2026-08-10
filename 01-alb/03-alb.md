## ALB作成

ALBを作成し、2つのリージョンにあるEC2インスタンスで負荷分散ができるようにしました。

![ALB設定](./images/01-web-lab-alb.png)
![ALB設定](./images/01-web-lab-alb-1.png)

## ターゲットグループ作成

ターゲットグループを作成し、２つのEC2インスタンス(`web-lab-web-ec2-a`,`web-lab-web-ec2-c`)を追加しました。

![ターゲットグループ設定](./images/01-web-lab-tg.png)
![ターゲットグループ設定](./images/01-web-lab-tg-1.png)
