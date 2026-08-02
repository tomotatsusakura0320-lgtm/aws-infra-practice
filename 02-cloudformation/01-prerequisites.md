## Parameter StoreにCloudWatch Agentの設定を保存

Parameter Storeのパラメータ /web-lab/cloudwatch-agent/config に、CloudWatch Agentの設定ファイルを保存しました。

```json
{
        "agent": {
                "metrics_collection_interval": 60,
                "run_as_user": "root"
        },
        "logs": {
                "logs_collected": {
                        "files": {
                                "collect_list": [
                                        {
                                                "file_path": "/var/log/nginx/access.log",
                                                "log_group_class": "STANDARD",
                                                "log_group_name": "/aws/ec2/nginx/access",
                                                "log_stream_name": "{instance_id}"
                                        },
                                        {
                                                "file_path": "/var/log/nginx/error.log",
                                                "log_group_class": "STANDARD",
                                                "log_group_name": "/aws/ec2/nginx/error",
                                                "log_stream_name": "{instance_id}"
                                        }
                                ]
                        }
                }
        },
        "metrics": {
                "append_dimensions": {
                        "AutoScalingGroupName": "${aws:AutoScalingGroupName}",
                        "ImageId": "${aws:ImageId}",
                        "InstanceId": "${aws:InstanceId}",
                        "InstanceType": "${aws:InstanceType}"
                },
                "metrics_collected": {
                        "cpu": {
                                "measurement": [
                                        "cpu_usage_idle",
                                        "cpu_usage_iowait",
                                        "cpu_usage_user",
                                        "cpu_usage_system"
                                ],
                                "metrics_collection_interval": 60,
                                "resources": [
                                        "*"
                                ],
                                "totalcpu": false
                        },
                        "disk": {
                                "measurement": [
                                        "used_percent",
                                        "inodes_free"
                                ],
                                "metrics_collection_interval": 60,
                                "resources": [
                                        "*"
                                ]
                        },
                        "diskio": {
                                "measurement": [
                                        "io_time"
                                ],
                                "metrics_collection_interval": 60,
                                "resources": [
                                        "*"
                                ]
                        },
                        "mem": {
                                "measurement": [
                                        "mem_used_percent"
                                ],
                                "metrics_collection_interval": 60
                        },
                        "swap": {
                                "measurement": [
                                        "swap_used_percent"
                                ],
                                "metrics_collection_interval": 60
                        }
                }
        }
}
```
---
## S3にWebコンテンツを保存

S3バケットにNginxのトップページとなるindex.htmlを保存しました。
EC2起動時にUserDataからS3上のindex.htmlを取得し、Nginxのドキュメントルートへ配置します。
