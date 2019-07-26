基于docker的nodejs && php开发环境。（一键安装dnnmmp）

**[[ENGLISH]](README-en.md)**

Dnnmmp包含以下组合
dnm(Docker + Nodejs + Mysql/MongoDB/Redis)
dnmn(Docker + Nodejs + Mysql/MongoDB/Redis + Nginx)
dnmp(Docker + Nginx + Mysql/MongoDB/Redis + PHP)

支持系统版本
Linux
MacOs
Windows

#特性
主要针对**nodejs**开发人员、**php**开发人员，或者**前端**人员（前后端程序调试）
支持**多版本**php，nodejs
兼容**OneinStack**的配置文件，完善的配置说明
支持**绑定多个域名**
清晰的docker文件、配置文件、日志文件
支持php**扩展**安装
程序是基于docker最新stable版，并从官方仓库下载
持续不断更新，支持交互、无人值守安装


#可选开源软件版本（同步docker仓库）
Web
nginx=1.17.*
nginx=1.16.*

DB
mysql=8.*
mysql=5.7.*
mysql=5.6.*

Nodejs
nodejs=12.*
nodejs=10.*
nodejs=8.*

PHP
php=7.4.*
php=7.3.*
php=7.2.*
php=7.1.*
php=5.6.*

MongoDB
mongodb=4.*
mongodb=3.*

Redis
mongodb=5.*
mongodb=4.*

#目录
- [1.目录结构](#1.目录结构)
- [2.安装步骤](#2.安装步骤)
- [3.命令行使用](#3.命令行使用)
- [4.php](#4.php)
- [5.日志](#5.日志)

## 1.目录结构

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

## 2.安装步骤
1. 本地安装`git`、`docker`和`docker-compose`(**建议使用最新版本**)。安装方法
2. `clone`项目：
    ```
    $ git clone git@github.com:wallace5303/dnnmmp.git
    ```
3. 如果不是`root`用户，还需将当前用户加入`docker`用户组：
    ```
    $ sudo gpasswd -a ${USER} docker
    ```
4. 启动：
    ```
    $ docker-compose up
    ```
    注意：Windows安装360安全卫士的同学，请先将其退出，不然安装过程中可能Docker创建账号过程可能被拦截，导致启动时文件共享失败；
5. 访问在浏览器中访问：

 - [http://localhost](http://localhost)
 - [https://localhost](https://localhost)

切换版本，安装扩展等，请修改**.env**文件，然后重新构建。

6. 常用命令
```bash
#服务列表：redis|mysql|mongodb|nginx|php

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
更多命令请查看：
- [docker-compose](https://docker_practice.gitee.io/compose/commands.html)
- [docker](https://docker_practice.gitee.io/appendix/command/)
开发者常用工具：
- [常用](http://www.kaka996.com/web/dh/dev)


## 3.命令行使用
1. 编辑 ~/.bashrc（或 ~/.zshrc），并在行尾添加
node () {
    tty=tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --volume $PWD:/var/www/html:rw \
        --workdir /var/www/html \
        dnnmmp_node node "$@"
}
npm () {
    tty=tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --volume $PWD:/var/www/html:rw \
        --workdir /var/www/html \
        dnnmmp_npm npm "$@"
}
php () {
    tty=tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --volume $PWD:/var/www/html:rw \
        --workdir /var/www/html \
        dnnmmp_php npm "$@"
}
composer () {
    tty=tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --user $(id -u):$(id -g) \
        --volume ~/dnmp/composer:/tmp \
        --volume /etc/passwd:/etc/passwd:ro \
        --volume /etc/group:/etc/group:ro \
        --volume $(pwd):/app \
        composer "$@"
}
2.必须执行：source ~/.bashrc 让修改的内容生效
ps:如果提示命令不存在，请重新打开终端窗口。（因为旧的终端，并不会重新加载该文件）



