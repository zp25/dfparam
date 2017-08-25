# dhparam-certs

<https://zp25.ninja>开启https，生成需要的证书和Diffie-Hellman parameter

~~~bash
docker-compose run --service-ports certbot certonly --standalone -d zp25.ninja -d www.zp25.ninja

# 查看状态
docker-compose ps
# 若State为Exit 0，清理容器
docker-compose rm
~~~
导出dhparam.pem到/etc/ssl/certs，导出证书到/etc/letsencrypt/zp25.ninja/live


+ [Certbot User Guide](https://certbot.eff.org/docs/using.html "Certbot User Guide")
+ [Alpine Linux:Mirrors](https://wiki.alpinelinux.org/wiki/Alpine_Linux:Mirrors "Alpine Linux:Mirrors")
