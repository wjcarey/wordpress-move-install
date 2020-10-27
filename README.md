# wordpress-move-install
move a wordpress install and modify the default virtual host file. the script will prompt you for old and new install locations. not for use in multisite wordpress configurations.

### run this code from the commandline. The script will ask you where to install wordpress files. You can also pass in old and new directories as arguments
~~~
sudo curl -o wordpress-move-install.sh https://raw.githubusercontent.com/wjcarey/wordpress-move-install/main/wordpress-move-install.sh && sudo chmod 777 wordpress-move-install.sh && sudo ./wordpress-move-install.sh
~~~