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

![systemctl staus nginx(a)画面](./images/01-systemctl-status-nginx-a.png)
![systemctl staus amazon-cloudwatch-agent(a)画面](./images/01-systemctl-status-amazon-cloudwatch-agent-a.png)
```bash
systemctl status nginx
systemctl status amazon-cloudwatch-agent
```
web-lab-web-ec2-aで、nginxとCloudwatchAgentの起動と自動起動の有効化を確認しました。

---
![systemctl staus nginx(c)画面](./images/01-systemctl-status-nginx-c.png)
![systemctl staus amazon-cloudwatch-agent(c)画面](./images/01-systemctl-status-amazon-cloudwatch-agent-c.png)
```bash
systemctl status nginx
systemctl status amazon-cloudwatch-agent
```
web-lab-web-ec2-cで、nginxとCloudwatchAgentの起動と自動起動の有効化を確認しました。
