## SSM接続

SSMを使用してec2インスタンス(web-lab-web-ec2-a/web-lab-web-ec2-c)に接続した。

---
## nginx,cloudwatchagent インストール

アップデートを確認した後、nginx,cloudwatchagentをインストール、起動し、自動起動を有効化した。
```bash
sudo dnf update -y

sudo systemctl install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

sudo systemctl install amazon-cloudwatch-agent -y
sudo systemctl start amazon-cloudwatch-agent
sudo systemctl enable amazon-cloudwatch-agent
```

---
## nginx,cloudwatchagent 起動確認

```bash
systemctl status nginx
```
nginxの起動と自動起動の有効化を確認した。

```bash
systemctl status amazon-cloudwatch-agent
```
cloudwatchagentの起動と自動起動の有効化を確認した。

