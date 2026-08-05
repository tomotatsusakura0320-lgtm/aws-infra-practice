## 関連リソースのインストール

SSMを使用してEC2インスタンス(`rds-lab-ec2-web-a`,`rds-lab-ec2-web-c`)に接続しました。

パッケージを更新した後、Nginxに対して、インストール、起動、自動起動の有効化を行いました。

```bash
sudo dnf update -y

sudo dnf install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```
PIPをインストールしました。

```bash
sudo dnf install python3-pip -y
```

MySQL Clientをインストールしました。

```bash
sudo dnf install mariadb105 -y
```
---
## Python仮想環境の作成

アプリケーション用ディレクトリを作成した後、Python仮想環境を作成、有効化しました。

```bash
mkdir ~/memo-app
cd ~/memo-app

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


















