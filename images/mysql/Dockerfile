FROM registry.cn-hongkong.aliyuncs.com/imxieke/debian:stretch

ENV GOSU_VERSION 1.7
ENV MYSQL_MAJOR 5.7
ENV MYSQL_VERSION 5.7.26-1debian9

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN set -x \
	&& groupadd -r mysql && useradd -r -g mysql mysql \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends gnupg dirmngr ca-certificates \
	pwgen openssl perl \
	&& key='A4A9406876FCBD3C456770C88C718D3B5072E1F5'; \
	gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key"; \
	gpg --batch --export "$key" > /etc/apt/trusted.gpg.d/mysql.gpg; \
	gpgconf --kill all; \
	apt-key list > /dev/null \
	&& echo "deb http://mirrors.ustc.edu.cn/mysql-repo/apt/debian/ stretch mysql-${MYSQL_MAJOR}" > /etc/apt/sources.list.d/mysql.list \
	# the "/var/lib/mysql" stuff here is because the mysql-server postinst doesn't have an explicit way to disable the mysql_install_db codepath besides having a database already "configured" (ie, stuff in /var/lib/mysql/mysql)
	# also, we set debconf keys to make APT a little quieter
	&& { \
		echo mysql-community-server mysql-community-server/data-dir select ''; \
		echo mysql-community-server mysql-community-server/root-pass password ''; \
		echo mysql-community-server mysql-community-server/re-root-pass password ''; \
		echo mysql-community-server mysql-community-server/remove-test-db select false; \
	} | debconf-set-selections \
	&& apt update && apt-get install -y mysql-server="${MYSQL_VERSION}" \
	&& rm -rf /var/lib/mysql \
	&& mkdir -p /var/lib/mysql /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
	# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
	&& chmod 755 /var/run/mysqld \
	# comment out a few problematic configuration values
	&& find /etc/mysql/ -name '*.cnf' -print0 \
		| xargs -0 grep -lZE '^(bind-address|log)' \
		| xargs -rt -0 sed -Ei 's/^(bind-address|log)/#&/' \
	# don't reverse lookup hostnames, they are usually another container
	&& echo '[mysqld]\nskip-host-cache\nskip-name-resolve' > /etc/mysql/conf.d/docker.cnf \
	&& apt-get purge -y --auto-remove wget ca-certificates  \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf ${HOME}/.gnupg \
	&& apt autoremove -y

VOLUME /var/lib/mysql

COPY scripts/5.7.sh /usr/local/bin/docker-entrypoint.sh
RUN ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh \
	&& chmod 777 /usr/local/bin/docker-entrypoint.sh \
	&& chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

EXPOSE 3306 33060
CMD ["mysqld"]
