@echo off
echo Starting FashionStore on Apache Tomcat 10.1...
"C:\Program Files\Java\jdk-21\bin\java.exe" ^
  "-Dcatalina.base=C:\Users\LENOVO\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0" ^
  "-Dcatalina.home=C:\Users\LENOVO\Downloads\apache-tomcat-10.1.57-windows-x64\apache-tomcat-10.1.57" ^
  "-Dwtp.deploy=C:\Users\LENOVO\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps" ^
  "-Djava.library.path=C:\Users\LENOVO\Downloads\apache-tomcat-10.1.57-windows-x64\apache-tomcat-10.1.57\bin" ^
  "--enable-native-access=ALL-UNNAMED" ^
  "--add-opens=java.base/java.lang=ALL-UNNAMED" ^
  "--add-opens=java.base/java.io=ALL-UNNAMED" ^
  "--add-opens=java.base/java.util=ALL-UNNAMED" ^
  "--add-opens=java.base/java.util.concurrent=ALL-UNNAMED" ^
  "--add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED" ^
  -cp "C:\Users\LENOVO\Downloads\apache-tomcat-10.1.57-windows-x64\apache-tomcat-10.1.57\bin\bootstrap.jar;C:\Users\LENOVO\Downloads\apache-tomcat-10.1.57-windows-x64\apache-tomcat-10.1.57\bin\tomcat-juli.jar" ^
  org.apache.catalina.startup.Bootstrap start

