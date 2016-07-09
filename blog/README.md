A simple blog using the Phalcon PHP Framework.
Original disigned by Stephan Miller, modified by Bravo Yeung (http://blog.csdn.net/lzuacm).

------
使用Phalcon框架开发一个简易的博客系统

step1: 在nginx对应的Web目录下创建文件夹blog(比如: ```/home/www/server/blog```)，然后```git clone git@github.com:yanglr/phalcon_practice.git``` 后，将```./phalcon_practice/blog```中的内容复制到文件夹```/home/www/server/blog```中；

step 2: 在nginx配置目录下的conf/vhost中配置多模块路由设置，在该目录下创建文件dev.blog.io.conf文件，其内容如下：



修改完后重启nginx。

step 3: 修改app/config/config.php文件中的Mysql的相关信息，根据具体的情况进行修改；

step 4:  在mysql中创建数据库phalconblog，然后将app/sql文件夹中的sql文件phalconblog-data.sql导入到mysql中，可以直接在mysql中导入，也可以用navicat进行导入...

step 5: 修改/etc/hosts文件，添加语句:

``` 
☐.☐.☐.☐	dev.blog.io
```
这里☐.☐.☐.☐是你在Linux下使用ifconfig命令看到的ip地址

step 6: 用浏览器访问 http://dev.blog.io 即可。



**特别说明:**

账号: admin  密码: admin

账号: test  密码: test
