***tomcat-users.xml***
To gain access to the Manager and Host Manager pages, you’ll need to define privileged users in Tomcat’s configuration.
This has been done for the tomcat-users.xml configuration file in this directory.
This file will replace the default tomcat-users.xml when you run the tomcat-webgui-access.yml
To change the username and password, edit the below lines in the tomcat-users.xml and put your desired credentials.

<role rolename="manager-gui" />
<user username="manager" password="manager_password" roles="manager-gui" />

<role rolename="admin-gui" />
<user username="admin" password="admin_password" roles="manager-gui,admin-gui" />


***context.xml***
This file has the <Valve> line commented out which allows connection from other IP addresses besides localhost


