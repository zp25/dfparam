# dhparam-certs

<https://zp25.ninja>开启https，生成需要的证书和Diffie-Hellman parameter

~~~bash
docker-compose run --service-ports certbot

# 查看状态
docker-compose ps
# 若State为Exit 0，清理容器
docker-compose rm
~~~
导出dhparam.pem到/etc/ssl/certs，导出证书到/etc/letsencrypt/zp25.ninja/live

## wait-for-dhparam.py
配置`depends_on`可以控制certbot等待dhparam启动后启动，但不能判断dhparam是否运行完成

dhparam耗时长，wait-for-dhparam.py控制在dhparam运行完成后启动certbot，保证在certbot运行完成时依赖的证书和Diffie-Hellman parameter都可使用


+ [Certbot User Guide](https://certbot.eff.org/docs/using.html "Certbot User Guide")
+ [Alpine Linux:Mirrors](https://wiki.alpinelinux.org/wiki/Alpine_Linux:Mirrors "Alpine Linux:Mirrors")
+ [Controlling startup order in Compose](https://docs.docker.com/compose/startup-order/ "Controlling startup order in Compose")
