## VPC作成

![VPC設定](./images/01-web-lab-vpc.png)

VPC(10.0.0.0/26)を作成しました。

---
## サブネット作成

![サブネット設定](./images/01-web-lab-public-subnet-a.png)
![サブネット設定](./images/01-web-lab-private-subnet-a.png)

ap-northeast-1aにパブリックサブネット(10.0.0.0/24)とプライベートサブネット(10.0.1.0/24)を作成しました。

![サブネット設定](./images/01-web-lab-public-subnet-c.png)
![サブネット設定](./images/01-web-lab-private-subnet-c.png)

同様に、ap-northeast-1cにパブリックサブネット(10.0.3.0/24)とプライベートサブネット(10.0.4.0/24)を作成しました。

---
## インターネットゲートウェイ作成

![インターネットゲートウェイ設定](./images/01-web-lab-igw.png)

インターネットゲートウェイを作成し、VPC(web-lab-vpc)にアタッチしました。

---
## NATゲートウェイ作成

![NATゲートウェイ設定](./images/01-web-lab-natgw.png)

NATゲートウェイを作成しました。

---
## ルートテーブル作成

![ルートテーブル設定](./images/01-web-lab-public-rt.png)

パブリックサブネット用ルートテーブルを１つ作成し、2つのパブリックサブネット(web-lab-public-subnet-aとweb-lab-public-subnet-c)に関連付けました。

![ルートテーブル設定](./images/01-web-lab-private-rt-a.png)
![ルートテーブル設定](./images/01-web-lab-private-rt-c.png)

プライベートサブネット用ルートテーブルを2つ作成し、2つのプライベートサブネット(web-lab-private-subnet-aとweb-lab-private-subnet-c)それぞれに関連付けました。

---
## セキュリティグループ作成

![セキュリティグループ設定](./images/01-web-lab-alb-sg.png)
![セキュリティグループ設定](./images/01-web-lab-alg-sg-1.png)

alb用セキュリティグループを作成し、HTTP(80)とHTTPS(443)を許可しました。

![セキュリティグループ設定](./images/01-web-lab-web-sg.png)
![セキュリティグループ設定](./images/01-web-lab-web-sg-1.png)

webサーバ用セキュリティグループを作成し、HTTP(80)とHTTPS(443)はalb用セキュリティグループからのみ許可した、

