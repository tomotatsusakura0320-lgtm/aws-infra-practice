# ALBを利用した高可用性Webシステム

## 概要

2つのAZに配置したWebサーバへALBで負荷分散する構成を構築しました。

---

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
