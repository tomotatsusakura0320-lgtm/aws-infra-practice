## VPC作成

![VPC作成](./images/01-web-lab-vpc.png)

VPC(10.0.0.0/26)を作成した。

---
## サブネット作成

![VPC作成](./images/01-web-lab-public-subnet-a.png)
![VPC作成](./images/01-web-lab-private-subnet-a.png)

ap-northeast-1aにパブリックサブネット(10.0.0.0/24)とプライベートサブネット(10.0.1.0/24)を作成した。

![VPC作成](./images/01-web-lab-public-subnet-c.png)
![VPC作成](./images/01-web-lab-private-subnet-c.png)

同様に、ap-northeast-1cにパブリックサブネット(10.0.3.0/24)とプライベートサブネット(10.0.4.0/24)を作成した。

---
## インターネットゲートウェイ作成

![VPC作成](./images/01-web-lab-igw.png)

インターネットゲートウェイを作成し、VPC(web-lab-vpc)にアタッチした。

---
## NATゲートウェイ作成

![VPC作成](./images/01-web-lab-natgw.png)

NATゲートウェイを作成した。

---
## ルートテーブル作成

![VPC作成](./images/01-web-lab-public-rt.png)

パブリックサブネット用ルートテーブルを１つ作成し、2つのパブリックサブネット(web-lab-public-subnet-aとweb-lab-public-subnet-c)に関連付けた。

![VPC作成](./images/01-web-lab-private-rt-a.png)
![VPC作成](./images/01-web-lab-private-rt-c.png)

プライベートサブネット用ルートテーブルを2つ作成し、2つのプライベートサブネット(web-lab-private-subnet-aとweb-lab-private-subnet-c)それぞれに関連付けた。

---
##　セキュリティグループ作成

![VPC作成](./images/01-web-lab-alb-sg.png)
![VPC作成](./images/01-web-lab-alg-sg-1.png)

alb用セキュリティグループを作成した。

![VPC作成](./images/01-web-lab-web-sg.png)
![VPC作成](./images/01-web-lab-web-sg-1.png)

webサーバ用セキュリティグループを作成した。

