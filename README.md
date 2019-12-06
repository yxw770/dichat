## api接口文档
http://www.docway.net/project/1Qp6vr4lRD7/1Qp6vuUEb7A
## 概要
下载后先解压apache-maven-3.3.9.zip

设置教程：
1.打开file->setting
![image](https://github.com/yxw770/dichat/blob/master/1.png)
2.找到Maven选项，①内填写刚刚解压的文件目录 ②选中Override ③填写刚刚解压的文件目录下的conf/settings.xml文件
![image](https://github.com/yxw770/dichat/blob/master/2.png)
3.找到Maven->importing选项，勾选上红框内的选项
![image](https://github.com/yxw770/dichat/blob/master/3.png)
4.打开file->Project Structure...
![image](https://github.com/yxw770/dichat/blob/master/4.png)
5.选择1.7的jdk如若没有请下载http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase7-521261.html#jdk-7u80-oth-JPR
![image](https://github.com/yxw770/dichat/blob/master/5.png)
请先导入数据库文件，然后修改/dichat_parent/dichat_a_web/src/main/resources/dataSource.properties文件内的数据库地址
