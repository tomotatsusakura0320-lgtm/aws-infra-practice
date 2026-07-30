## nginxトップページ変更
変更前(共通）
![nginxトップページ設定画面](./01-systemctl-status-nginx)
変更後(web-lab-web-ec2-a)
![nginxトップページ設定画面(a)](./01-systemctl-status-nginx-a)
変更後(web-lab-web-ec2-c)
![nginxトップページ設定画面(c)](./01-systemctl-status-nginx-c)
ブラウザからalbによる負荷分散が行われているか確認ができるように、nginxのトップページを変更しました。


## 動作確認

![nginxトップ(a)画面](./01-browser-nginx-top-a)
![nginxトップ(c)画面](./01-browser-nginx-top-c)
ブラウザからアクセスし、インスタンスが切り替わるかを確認しました。
