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





