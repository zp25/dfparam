FROM certbot/certbot:latest

VOLUME ["/etc/ssl/certs", "/etc/letsencrypt", "/var/lib/letsencrypt"]

COPY ./wait-for-dhparam.py /tmp/wait-for-dhparam.py

ENTRYPOINT ["python", "/tmp/wait-for-dhparam.py", "certbot"]
