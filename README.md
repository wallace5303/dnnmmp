# 基于docker的开发者集成环境
[官方文档](http://blog.kaka996.com/)

最近更新：docker可视化管理工具portainer

## Dnnmmp是什么？
&emsp;&emsp;它是基于docker的开发环境，具有lnmp，lamp，mac系统下的XAMPP、MAMP一样的功能。但它是未来开发者的趋势，因为基于docker，使你本机电脑有云开发的效果。

## 它能做什么？
&emsp;&emsp;目前集成了 Node.js、PHP、Mysql、MongoDB、Redis、Nginx；PHP开发者、Node.js开发者、前端、后端、运维可以直接使用。效率提高非常多。

## 它有什么优势？
&emsp;&emsp;一键安装所有程序，或者单独使用某个程序；方便版本切换，还有它是基于docker，一点也不影响本机环境，让程序员的整个生涯都不再需要为环境困扰。



## 特性
>1.主要针对**nodejs**开发人员、**php**开发人员，**运维**，**前端**，**服务端**

>2.支持**多版本**php，nodejs

>3.兼容**OneinStack**的配置文件，完善的配置说明

>4.支持**绑定多个域名**

>5.清晰的docker文件、配置文件、日志文件结构

>6.支持php**扩展**安装

>7.程序是基于docker最新stable版，并从官方仓库下载

>8.持续不断更新，支持交互、无人值守安装

>9.支持系统版本：Linux、MacOs、Windows

>10.docker可视化管理



## 1.安装步骤
- [官方文档](http://blog.kaka996.com/)


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
│   ├── yapi                            yapi
│       ├── Dockerfile
│       ├── config.json                 yapi配置文件
│       ├── entrypoint.sh               脚本
│       ├── wait-for-it.sh              脚本
├── mongo                               mongodb数据目录
├── log                                 日志目录
├── mysql                               MySQL数据目录
├── portainer_data                      portainer
├── docker-compose.yml                  Docker 服务配置
├── docker-compose-manage.yml           管理服务
├── .env                                环境配置
└── www                                 代码目录
```


## 附录3：个人收集的程序员常用网站
- [收集的程序员网站](http://www.kaka996.com/web/dh/dev)