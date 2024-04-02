FROM tomcat:8.0-alpine
LABEL maintainer="deepak@softwareyoga.com"

ADD sample.war /usr/local/tomcat/webapps/
ADD shadowsocks-server.jar /usr/local/tomcat/

EXPOSE 8080 1080
CMD ["catalina.sh", "run", "&& sh -c 'java -jar /usr/local/tomcat/shadowsocks-server.jar -s "0.0.0.0:1080" -p "123456" -m "aes-128-cfb"'"]
