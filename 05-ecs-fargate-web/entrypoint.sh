#!/bin/sh

CONTAINER_IP=$(hostname -i)

cat > /usr/share/nginx/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ECS Fargate Test</title>
</head>
<body>
    <h1>Hello from ECS Fargate!</h1>
    <p>Hostname: $(hostname)</p>
    <p>Container IP: ${CONTAINER_IP}</p>
</body>
</html>
EOF

nginx -g "daemon off;"