# ALBを利用した高可用性Webシステム

## 概要
AWS上に高可用性を意識したWebサーバ環境を構築しました。

2つのAZに配置したEC2上でnginxを稼働させ、
Application Load Balancer(ALB)を経由してブラウザからアクセスできる構成を作成しました。

また、EC2はプライベートサブネットに配置し、
Systems Manager Session Manager(SSM)を利用して管理を行いました。

## 構成図

![構成図](AWS-Practice-01.png)

---

## システム構成

- VPC
- Public Subnet ×2
- Private Subnet ×2
- ALB
- EC2 ×2
- NAT Gateway ×2
- Session Manager

---
