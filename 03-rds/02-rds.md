## RDSサブネットグループ作成
サブネットグループを作成しました

![サブネットグループ](./images/03-rds-lab-subnet-group.png)

## RDS作成
![RDS1](./images/03-rds-lab-rds.png)
![RDS2](./images/03-rds-lab-rds-1.png)
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
