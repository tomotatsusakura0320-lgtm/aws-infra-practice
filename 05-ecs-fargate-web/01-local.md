## Dockerfile作成

ECS Fargateで実行するWebコンテナを作成するため、Nginxをベースとした[Dockerfile](./Dockerfile)を作成しました。

## entrypoint.sh作成

コンテナ起動時にWebページを生成し、コンテナのホスト名を表示した上でNginxを起動する[entrypoint.sh](./entrypoint.sh)を作成しました。

## Dockerイメージの作成

以下のコマンドを実行してDockerfileからDockerイメージを作成しました。

```bash
docker build -t ecs-fargate-web:latest .
```
その後 `docker images` コマンドを使用し `ecs-fargate-web` が存在することを確認しました。

## ローカルで動作確認

以下のコマンドを実行してコンテナを起動しました。

```bash
docker run -d -p 8080:80 --name ecs-fargate-web ecs-fargate-web:latest
```

その後ブラウザから `http://localhost:8080` へアクセスし、以下のように
