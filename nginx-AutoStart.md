Nginx加为系统服务(service nginx start/stop/restart)

1.下载脚本
wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx --no-check-certificate

2.修改权限
chmod +x /etc/init.d/nginx

3.修改nginx的路径
根据实际情况对nginx脚本进行修改
vi /etc/init.d/nginx

将变量NGINXPATH改为：
NGINXPATH=${NGINXPATH:-/usr/local/openresty/nginx}
保存，退出即可...

4.使用方法:
service nginx start
service nginx stop
service nginx restart
