# Amazon ECS Fargateを利用したコンテナWebシステムの構築

## 概要

AWS上にAmazon ECS Fargateを利用したコンテナWebシステムを構築しました。

DockerでnginxをベースとしたWebサーバーをコンテナ化し、DockerイメージをAmazon ECRへ登録しました。

その後、ECS Task Definitionでコンテナの実行環境を定義し、ECS ServiceによってFargate Taskを2つ起動しました。

また、Application Load Balancer（ALB）とTarget GroupをECS Serviceに連携し、ALB経由でFargate Taskへアクセスできる構成を作成しました。WebページにはコンテナのHostnameとIPアドレスを表示し、複数のTaskへリクエストが分散されることを確認しました。

さらに、稼働中のFargate Taskを停止し、ECS Serviceによって新しいTaskが自動的に起動・復旧することを確認しました。また、FargateコンテナのログをAmazon CloudWatch Logsへ出力し、ログを確認しました。
