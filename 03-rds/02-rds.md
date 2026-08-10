## RDSサブネットグループ作成

IAMロール `rds-lab-ec2-role` を作成し、ポリシー(`AmazonSSMManagedInstanceCore`,`CloudWatchAgentServerPolicy`)をアタッチしました。

## RDS作成
EC2インスタンスを以下の設定で作成し、パブリックサブネット(`rds-lab-public-subnet-a`)に配置しました。

- マシンイメージ：Amazon Linux 2023
- インスタンスタイプ：t3.micro
- キーペア：あり
- セキュリティグループ：`rds-lab-sg-ec2`
- IAMロール：`rds-lab-ec2-role`

## CREATE
SSM接続後、MySQLに接続しました

```bash
mysql -h rds-lab-rds.xxxxxxxxx.ap-northeast-1.rds.amazonaws.com -P 3306 -u xxxx -p
```

データベースを作成しました
```sql
CREATE DATABASE practice_db;
USE practice_db;
```

テーブルを作成しました
```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## INSERT

```sql
INSERT INTO users (name, email)
VALUES
('Taro', 'taro@example.com'),
('Hanako', 'hanako@example.com');
```

## SERECT
```sql
SELECT * FROM users;
```

## UPDATE
```sql
UPDATE users
SET email = 'taro-new@example.com'
WHERE name = 'Taro';

SELECT * FROM users;
```

## DELETE
```sql
DELETE FROM users
WHERE name = 'Hanako';

SELECT * FROM users;
```
