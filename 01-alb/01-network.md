## VPC作成

VPCを作成しました。

![VPC設定](./images/01-web-lab-vpc.png)

## サブネット作成

ap-northeast-1aにパブリックサブネットとプライベートサブネットを作成しました。

![サブネット設定](./images/01-web-lab-public-subnet-a.png)
![サブネット設定](./images/01-web-lab-private-subnet-a.png)

---

同様に、ap-northeast-1cにパブリックサブネットとプライベートサブネットを作成しました。

![サブネット設定](./images/01-web-lab-public-subnet-c.png)
![サブネット設定](./images/01-web-lab-private-subnet-c.png)


## インターネットゲートウェイ作成

インターネットゲートウェイを作成し、VPCにアタッチしました。

![インターネットゲートウェイ設定](./images/01-web-lab-igw.png)


## NATゲートウェイ作成

2つのパブリックサブネットそれぞれにNATゲートウェイを作成し、ElasticIPを割り当てました。

![NATゲートウェイ設定](./images/01-web-lab-natgw-a.png)
![NATゲートウェイ設定](./images/01-web-lab-natgw-c.png)

## ルートテーブル作成

パブリックサブネット用ルートテーブルを１つ作成し、2つのパブリックサブネットに関連付けました。

![ルートテーブル設定](./images/01-web-lab-public-rt.png)

---

プライベートサブネット用ルートテーブルを2つ作成し、2つのプライベートサブネットそれぞれに関連付けました。

![ルートテーブル設定](./images/01-web-lab-private-rt-a.png)
![ルートテーブル設定](./images/01-web-lab-private-rt-c.png)


## セキュリティグループ作成

ALB用セキュリティグループを作成し、HTTP(80)とHTTPS(443)を許可しました。

![セキュリティグループ設定](./images/01-web-lab-alb-sg.png)
![セキュリティグループ設定](./images/01-web-lab-alg-sg-1.png)

---

Webサーバ用セキュリティグループを作成し、HTTP(80)とHTTPS(443)はALB用セキュリティグループからのみ許可しました。

![セキュリティグループ設定](./images/01-web-lab-web-sg.png)
![セキュリティグループ設定](./images/01-web-lab-web-sg-1.png)
