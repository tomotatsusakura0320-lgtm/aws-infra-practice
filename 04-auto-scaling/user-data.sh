#!/bin/bash

# パッケージ更新
dnf update -y

# nginxインストール・起動
dnf install nginx -y
systemctl start nginx
systemctl enable nginx

# CloudWatch Agentインストール
dnf install amazon-cloudwatch-agent -y

# 02-cloudformation/01-prerequisites.mdで作成したParameter StoreからCloudWatch Agentの設定を取得して起動
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config \
  -m ec2 \
  -s \
  -c ssm:/web-lab/cloudwatch-agent/config

# IMDSv2からトークンを取得
TOKEN=$(curl -X PUT \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600" \
  -s \
  http://169.254.169.254/latest/api/token)

# EC2自身の情報を取得
INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  -s \
  http://169.254.169.254/latest/meta-data/instance-id)

AZ=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  -s \
  http://169.254.169.254/latest/meta-data/placement/availability-zone)

PRIVATE_IP=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  -s \
  http://169.254.169.254/latest/meta-data/local-ipv4)

# Webコンテンツを作成
cat > /usr/share/nginx/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AWS Auto Scaling Test</title>
</head>
<body>
    <h1>Welcome to nginx!</h1>
    <p>Instance ID: ${INSTANCE_ID}</p>
    <p>Availability Zone: ${AZ}</p>
    <p>Private IP: ${PRIVATE_IP}</p>
</body>
</html>
EOF
