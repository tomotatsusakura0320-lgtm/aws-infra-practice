## 関連リソースインストール

SSMを使用してEC2インスタンス(`rds-lab-ec2-web-a`,`rds-lab-ec2-web-c`)に接続しました。

---
パッケージを更新した後、Nginxに対して、インストール、起動、自動起動の有効化を行いました。

```bash
sudo dnf update -y

sudo dnf install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```

---
## PIPインストール

PIPをインストールしました。

```bash
sudo dnf install python3-pip -y
```

## MySQL Clientインストール


```bash
sudo dnf install mariadb105 -y
```
