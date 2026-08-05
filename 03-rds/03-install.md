## 関連リソースのインストール

SSMを使用してEC2インスタンス(`rds-lab-ec2-web-a`,`rds-lab-ec2-web-c`)に接続しました。

パッケージを更新した後、Nginxに対して、インストール、起動、自動起動の有効化を行いました。

```bash
sudo dnf update -y

sudo dnf install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```
PIPをインストールした後、正常にインストールされていることを確認しました。

```bash
sudo dnf install python3-pip -y
pip3 --version
```

MySQL Clientをインストールした後、正常にインストールされていることを確認しました。

```bash
sudo dnf install mariadb105 -y
mariadb --version
```
---
## Python仮想環境の作成

アプリケーション用ディレクトリを作成した後、Python仮想環境を作成、有効化しました。

```bash
mkdir -p /home/ssm(ec2?)-user/memo-app
cd /home/ssm-user/memo-app

python3 -m venv venv
source venv/bin/activate
```

---
## Pythonパッケージのインストール

以下のPythonパッケージをインストールしました。

- Flask
- Gunicorn
- PyMySQL

```bash
pip install flask gunicorn pymysql
```

---
## Flaskアプリケーション作成

---


















