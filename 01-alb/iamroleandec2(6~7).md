## IAMロール作成

![IAMロール設定](./images/01-web-lab-web-ec2-role.png)

IAMロールを作成し、許可ポリシーとして、AmazonSSMManagedInstanceCoreとCloudWatchAgentServerPolicyを付与した。

---
## EC2インスタンス作成

![EC2設定](./images/01-web-lab-web-ec2-a.png)

web-lab-private-subnet-aにec2インスタンスを作成した。

![EC2設定](./images/01-web-lab-web-ec2-c.png)

web-lab-private-subnet-cにec2インスタンスを作成した。
