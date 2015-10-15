In case a Redis service instance cannot be created via the CF marketplace:

Get a Redis DB from [RedisLabs](https://redislabs.com/)

```bash
$ cf cups rediscups -p "hostname, password, port"

hostname> pub-redis-...us-east-1-4.6.ec2.redislabs.com

password> PASSWORD

port> PORT

$ cf bs stateful-app rediscups
$ cf rs stateful-app
```
