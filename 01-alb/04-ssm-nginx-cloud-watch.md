## SSM接続

SSMを使用してec2インスタンス(web-lab-web-ec2-a/web-lab-web-ec2-c)に接続しました。

---
## nginx,CloudwatchAgent インストール

```bash
sudo dnf update -y

sudo dnf install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

sudo dnf install amazon-cloudwatch-agent -y
sudo systemctl start amazon-cloudwatch-agent
sudo systemctl enable amazon-cloudwatch-agent
```
アップデートを確認した後、nginxとCloudwatchAgentをインストール、起動し、自動起動を有効化しました。

---
## nginx,CloudwatchAgent 起動確認

![systemctl staus nginx(a)画面](./01-systemctl-status-nginx-a)
![systemctl staus nginx(c)画面](./01-systemctl-status-nginx-c)

```bash
systemctl status nginx
```
nginxの起動と自動起動の有効化を確認しました。

---
![systemctl staus amazon-cloudwatch-agent(a)画面](./01-systemctl-status-amazon-cloudwatch-agent-a)
![systemctl staus amazon-cloudwatch-agent(c)画面](./01-systemctl-status-amazon-cloudwatch-agent-c)

```bash
systemctl status amazon-cloudwatch-agent
```
CloudwatchAgentの起動と自動起動の有効化を確認しました。

