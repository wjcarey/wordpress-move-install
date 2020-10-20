#! /bin/bash

if [ -z "$1" ]
    then
        echo "enter the current install path ..."
        read OLD_INSTALL_PATH
        echo "enter the location for your new install path ..."
        read NEW_INSTALL_PATH
        echo -e "\e[32mconfirm wordpress move from ${OLD_INSTALL_PATH} to ${NEW_INSTALL_PATH}, Do you want to continue? [Y/n]"

    else
    OLD_INSTALL_PATH=${1}
    NEW_INSTALL_PATH=${2}
    CONFIRM_WORDPRESS_MOVE="Y"
fi

OLD_INSTALL_PATH=$(realpath -s --canonicalize-missing $INSTALL_PATH)
NEW_INSTALL_PATH=$(realpath -s --canonicalize-missing $INSTALL_PATH)

if [ "$CONFIRM_WORDPRESS_MOVE" != "${CONFIRM_WORDPRESS_MOVE#[Yy]}" ] ;then
    mkdir ${NEW_INSTALL_PATH}
    chmod 775 -R ${NEW_INSTALL_PATH} && chown www-data:www-data ${NEW_INSTALL_PATH}
    mv { ${OLD_INSTALL_PATH}/*, ${OLD_INSTALL_PATH}/.* } ${NEW_INSTALL_PATH}
    echo "updating apache2 default virtual host ..."
    sed -i 's/${OLD_INSTALL_PATH}/${NEW_INSTALL_PATH}/' /etc/apache2/sites-available/000-default.conf
else
    echo "notice: the wordpress installer was skipped by user..."
fi

#SELF DELETE AND EXIT
rm -- "$0"
exit