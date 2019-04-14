# dhparam-certs

<https://zp25.ninja>开启https，生成需要的证书和Diffie-Hellman parameter

~~~bash
docker-compose run --name certs --service-ports certbot
# or
docker-compose run --name certs --service-ports certbot \
    certonly --standalone \
    -d zp25.ninja \
    -d api.zp25.ninja \
    -d dev.zp25.ninja \
    -d home.zp25.ninja \
    -d www.zp25.ninja

# 查看状态
docker-compose ps
~~~

生成dhparam.pem和证书，运行dhparam会花费较长时间

## wait-for-dhparam.py {#wait-for-dhparam}

配置`depends_on`可以控制certbot等待dhparam启动后启动，但不能判断dhparam是否运行完成

dhparam耗时长，wait-for-dhparam.py控制在dhparam运行完成后启动certbot，保证在certbot运行完成时依赖的证书和Diffie-Hellman parameter都可使用

## tests {#tests}

测试

~~~bash
docker-compose run --name staging --service-ports certbot \
    certonly --standalone --test-cert -d zp25.ninja -d www.zp25.ninja
~~~

在staging environment中测试

<https://letsencrypt.org/docs/staging-environment/>

~~~bash
docker-compose run --name dryrun --service-ports --rm certbot renew --dry-run
~~~

测试更新证书

## copy {#copy}

将文件从volumes导出到本地路径

~~~bash
docker ps -a

docker cp [dhparamContainer]:/etc/ssl/certs/dhparam.pem /local/path/to/dhparam.pem
docker cp [certsContainer]:/etc/letsencrypt /local/path/to/letsencrypt
~~~

导出证书

## expand {#expand}

重新签发证书注意事项

+ 任务完成后container未清理，可执行`docker-compose down`
+ wait-for-dhparam仅判断dhparam.pem是否存在，重新签发前删除dhparam-certs_dhparam卷

也可以保留dhparam-certs_dhparam卷，dhparam.pem依然会更新，但是注意查看dhparam容器是否执行完成，因为certs不再等待dhparam容器完成

+ [certbot - docker hub](https://hub.docker.com/u/certbot "certbot")
+ [Certbot User Guide](https://certbot.eff.org/docs/using.html "Certbot User Guide")
+ [Alpine Linux:Mirrors](https://wiki.alpinelinux.org/wiki/Alpine_Linux:Mirrors "Alpine Linux:Mirrors")
+ [Controlling startup order in Compose](https://docs.docker.com/compose/startup-order/ "Controlling startup order in Compose")
