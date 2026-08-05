## Nginxトップページ変更

ブラウザからALBによる負荷分散が行われているか確認ができるように、Nginxのトップページを変更しました。

変更前(共通）

![nginxトップページ設定画面](./images/01-nginx-top-before.png)

変更後(`web-lab-web-ec2-a`)

![nginxトップページ設定画面](./images/01-nginx-top-after-a.png)

変更後(`web-lab-web-ec2-c`)

![nginxトップページ設定画面](./images/01-nginx-top-after-c.png)

---
## 動作確認


ブラウザからアクセスし、インスタンスが切り替わることを確認しました。

![nginxトップページ](./images/01-nginx-top-a.png)
![nginxトップページ](./images/01-nginx-top-c.png)

