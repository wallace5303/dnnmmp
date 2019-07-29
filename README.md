# 基于docker的nodejs、php开发环境

## Dnnmmp包含以下组合
>dnm(Docker + Nodejs + Mysql/MongoDB/Redis)

>dnmn(Docker + Nodejs + Mysql/MongoDB/Redis + Nginx)

>dnmp(Docker + Nginx + Mysql/MongoDB/Redis + PHP)

>支持系统版本：Linux、MacOs、Windows

## 特性
>1.主要针对**nodejs**开发人员、**php**开发人员，**运维**，**前端**

>2.支持**多版本**php，nodejs

>3.兼容**OneinStack**的配置文件，完善的配置说明

>4.支持**绑定多个域名**

>5.清晰的docker文件、配置文件、日志文件结构

>6.支持php**扩展**安装

>7.程序是基于docker最新stable版，并从官方仓库下载

>8.持续不断更新，支持交互、无人值守安装


## 可选软件版本
>[docker官方仓库](https://docs.docker.com/samples/)

>nginx=1.17 / 1.16

>mysql=8 / 5.7 / 5.6

>nodejs=12 / 10 / 8

>php=7.4 / 7.3 / 7.2 / 7.1 / 5.6

>mongodb=4 / 3

>redis=5 / 4

# 目录
- [1.安装步骤](#2.安装步骤)
- [2.命令行使用](#3.命令行使用)
- [3.php扩展](#4.php扩展)
- [4.日志](#5.日志)
- [附录1：docker安装](#附录1：docker安装)
- [附录2：目录结构](#附录2：目录结构)
- [附录3：收集的程序员常用网站](#附录3：收集的程序员常用网站)
- [附录4：常见的问题](#附录4：常见的问题)

## 1.安装步骤
1. 本地安装`git`、`docker`和`docker-compose`(**建议使用最新版本:1.23**)。
   [附录1：docker安装](#附录1：docker安装)
2. `clone`项目：
    ```bash
    # 如果不是`root`用户，那么将当前用户加入`docker`用户组
    $ sudo gpasswd -a ${USER} docker

    # 获取项目
    $ git clone git@github.com:wallace5303/dnnmmp.git
    ```
3. 构建并启动：
    ```bash
    $ cd dnnmmp

    # 构建并运行（第一次安装建议使用此命令，方便查看打印的日志）
    $ docker-compose up

    # 后台运行
    $ docker-compose up -d
    ```
    >注意：Windows安装360安全卫士的同学，请先将其退出，不然安装过程中可能Docker创建账号过程可能被拦截，导致启动时文件共享失败；

    >查看生成的镜像：```$ docker image ls```

    >查看启动的容器：```$ docker container ls```

    >[附录4：常见的问题](#附录4：常见的问题)

4. 访问在浏览器中访问：
    [http://localhost](http://localhost),
    [https://localhost](https://localhost)

5. 常用命令
```bash
# 服务列表：redis|mysql|mongodb|nginx|php

# 列出 Compose 文件中包含的镜像
$ docker-compose images

# 创建所有服务并启动
$ docker-compose up
$ docker-compose up -d          # 全部后台启动

# 创建单个服务
$ docker-compose up redis
$ docker-compose up redis -d    # 后台启动

# 如果容器已经创建
# 启动
$ docker-compose start redis

# 停止
$ docker-compose stop redis

# 重启
$ docker-compose restart redis

# 重新构建
$ docker-compose build redis

# 删除
$ docker-compose rm redis
```
更多docker命令，请查看：
- [docker](https://docker_practice.gitee.io/appendix/command/)
- [docker-compose](https://docker_practice.gitee.io/compose/commands.html)

## 2.命令行使用
1. docker安装的程序与直接安装在宿主机上的程序不同，如果需要使用命令行，有两种方法，
- >（1）进入docker创建的容器中执行命令

- >（2）添加bash快捷命令，如下：

- >编辑 ```~/.bashrc（或 ~/.zshrc）```，并在行尾添加

    ```bash
    # 如果电脑上已经安装过软件，请更换函数名称
    node () {
        tty=
        tty -s && tty=--tty
        docker run \
            $tty \
            --interactive \
            --rm \
            --volume $PWD:/var/www/html:rw \
            --workdir /var/www/html \
            dnnmmp_node node "$@"
    }
    npm () {
        tty=
        tty -s && tty=--tty
        docker run \
            $tty \
            --interactive \
            --rm \
            --volume $PWD:/var/www/html:rw \
            --workdir /var/www/html \
            dnnmmp_node npm "$@"
    }
    php () {
        tty=
        tty -s && tty=--tty
        docker run \
            $tty \
            --interactive \
            --rm \
            --volume $PWD:/var/www/html:rw \
            --workdir /var/www/html \
            dnnmmp_php72 php "$@"
    }
    composer () {
        tty=
        tty -s && tty=--tty
        docker run \
            $tty \
            --interactive \
            --rm \
            --user $(id -u):$(id -g) \
            --volume ~/dnnmmp/composer:/tmp \
            --volume /etc/passwd:/etc/passwd:ro \
            --volume /etc/group:/etc/group:ro \
            --volume $(pwd):/app \
            composer "$@"
    }
    ```

- >（3）让修改的内容生效
    ```
    $ source ~/.bashrc（或 ~/.zshrc）
    ```
- >注意：如果提示命令不存在，请重新打开终端窗口。（因为旧的终端，并不会重新加载该文件）

- >（4）查看版本信息
    ```
    $ node -v
    v10.16.0

    $ npm -v
    6.9.0

    $ php -v
    PHP 7.2.19 (cli) (built: Jun 28 2019 03:58:08) ( NTS )
    Copyright (c) 1997-2018 The PHP Group
    Zend Engine v3.2.0, Copyright (c) 1998-2018 Zend Technologies
        with Zend OPcache v7.2.19, Copyright (c) 1999-2018, by Zend Technologies
        
    $ composer -v
    Composer version 1.8.6 2019-06-11 15:03:05
    ```

2.  快速进入容器

    了解docker的同学知道，经常需要进入容器中查看内容，配置进入容器命令。

    编辑 ```~/.bashrc（或 ~/.zshrc）```，添加：
    ```bash
    alias dmysql='docker exec -it dnnmmp_mysql_1 /bin/bash'
    alias dredis='docker exec -it dnnmmp_redis_1 /bin/sh'
    alias dnginx='docker exec -it dnnmmp_nginx_1 /bin/sh'
    alias dmongodb='docker exec -it dnnmmp_mongodb_1 /bin/sh'
    alias dphp72='docker exec -it dnnmmp_php72_1 /bin/bash'
    ```
    使生效：
    ```
    $source ~/.bashrc（或 ~/.zshrc）
    ```

## 3.php扩展
1.  添加扩展：编辑.env文件
    ```bash
    #从扩展列表中选择相应的扩展，添加到此行中，英文逗号隔开
    PHP72_EXTENSIONS=curl,opcache,redis
    ```
    >重新build PHP镜像：docker-compose build php72 docker-compose up -d

## 4.日志
php日志目录：./log/php/

nginx日志目录：./log/nginx/

mysql数据及日志目录：./mysql/

mongo数据及日志目录：./mongo/

## 附录1：docker安装

- [docker安装](https://docker_practice.gitee.io/install/)
- [docker-compose安装](https://docker_practice.gitee.io/compose/)
  
## 附录2：目录结构
```
/
├── composer                            Composer配置与缓存
├── config                              配置文件
│   ├── mongodb                         mongodb
│       ├── Dockerfile                  Dockerfile文件
│   ├── mysql                           mysql
│       ├── Dockerfile
│       ├── mysql.cnf                   mysql配置文件
│   ├── nginx                           nginx
│       ├── conf.d
│           ├── certs                   秘钥
│           ├── localhost_https.conf    https虚拟主机
│           ├── localhost.conf          虚拟主机
│       ├── Dockerfile
│       ├── nginx.conf                  nginx配置
│   ├── node                            node
│       ├── Dockerfile
│   ├── php                             php
│       ├── extensions                  扩展及脚本
│           ├── install.sh              基础安装脚本
│           ├── php56.sh                php5.6扩展安装脚本
│           ├── php72.sh                php7.2扩展安装脚本
│       ├── Dockerfile
│       ├── php-fpm.conf                php-fpm配置文件
│       ├── php.ini                     php.ini配置文件
│   ├── redis                           redis
│       ├── Dockerfile
│       ├── redis.conf                  redis配置文件
├── mongo                               mongodb数据目录
├── log                                 日志目录
├── mysql                               MySQL数据目录
├── docker-compose.yml                  Docker 服务配置
├── .env                                环境配置
└── www                                 代码目录
```


## 附录3：个人收集的程序员常用网站
- [收集的程序员网站](http://www.kaka996.com/web/dh/dev)