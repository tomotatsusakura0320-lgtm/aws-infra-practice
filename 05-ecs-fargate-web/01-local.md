## Dockerfile作成

ECS Fargateで実行するWebコンテナを作成するため、Nginxをベースとした[Dockerfile](./Dockerfile)を作成しました。

## 作成

コンテナ起動時にWebページを生成し、コンテナのホスト名を表示した上でNginxを起動する[entrypoint.sh](./entrypoint.sh)を作成しました。
