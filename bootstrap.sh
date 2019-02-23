#!/bin/env/ bash

users="lyq lcj lzy wyx lqs cmy ak lmy szy zjr wx mbn mxl dzz"
admins="wl cys"
password=kido

function entering() {
    echo "==================== Entering $1"
}

function leaving() {
    echo "==================== Leaving $1"
}

function check_root_or_exit() {
    if [[ $EUID -ne 0 ]]; then
	echo "请先执行sudo su"
	exit 1
    fi
}

function download_files() {
    entering ${FUNCNAME[0]}

    if [[ ! -f synaptics.conf ]]; then
        wget -O synaptics.conf "https://gist.githubusercontent.com/wlnirvana/d4115070f81e074a937a4e0f0c88031e/raw/9ae926008a00a56e035a8d014bd93c8b677de6ec/synaptics.conf"
    fi
    if [[ ! -f sources.list ]]; then
        wget -O sources.list  "https://gist.githubusercontent.com/wlnirvana/c99a66e3301307200e2980a2f6313444/raw/28cec90b21057048b559566b84313a3f3d5494ec/tuna_xenial_sources.list"
    fi
    if [[ ! -f eclipse.desktop ]]; then
        wget -O eclipse.desktop "https://gist.githubusercontent.com/wlnirvana/c48cccfac51d233ba3edd535dfb39a18/raw/ca1f1c736fed1b1bfa4a52b21614593b04f06d1a/lxde_eclipse.desktop"
    fi
    if [[ ! -f default.yaml ]]; then
        wget -O default.yaml "https://gist.githubusercontent.com/wlnirvana/3dffa58e3005a3f2c2a5604bb89ed2f1/raw/fe48b0d5d4b6c26c666499e6c037f06150303c03/default.yaml"
    fi
    if [[ ! -f profile.desc ]]; then
        wget -O profile.desc "https://gist.githubusercontent.com/wlnirvana/cf65984f6bfd2a18d0ecef0650fd63b8/raw/644e63165ea6f228a8901d121666a0011153c12e/profile.desc"
    fi
    if [[ ! -f code_1.29.1-1542309157_amd64.deb ]]; then
        wget "https://mirrors.shu.edu.cn/vscode/repos/vscode/pool/main/c/code/code_1.29.1-1542309157_amd64.deb"
    fi
    if [[ ! -f eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz ]]; then
        wget "https://mirrors.tuna.tsinghua.edu.cn/eclipse/technology/epp/downloads/release/luna/SR2/eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz"
    fi
}

function disable_auto_update() {
    entering ${FUNCNAME[0]}
    sed -i 's/Prompt=.*/Prompt=never/' /etc/update-manager/release-upgrades
    sed -i 's/APT::Periodic::Update-Package-Lists "1"/APT::Periodic::Update-Package-Lists "0"/' /etc/apt/apt.conf.d/10periodic
}

function disable_touchpad() {
    entering ${FUNCNAME[0]}
    find /usr/share/X11/xorg.conf.d/ -name "*-synaptics.conf" -exec sh -c 'cat synaptics.conf >> "$1"' -- {} \;
}

function update_apt_sources() {
    entering ${FUNCNAME[0]}

    # replace source with tuna
    mv /etc/apt/sources.list /etc/apt/sources.list.bak
    mv sources.list /etc/apt/sources.list

    apt-get update
}

function install_packages() {
    entering ${FUNCNAME[0]}

    apt-get install -y git debconf-utils nodejs npm
    apt-get install -y "openjdk-8*" maven
    apt-get install -y fcitx-rime fcitx-frontend-gtk2 fcitx-frontend-gtk3
    apt-get install -y openssh-server
    # visual studio code
    dpkg -i ./code_1.29.1-1542309157_amd64.deb
    apt-get install -fy
    # eclipse
    tar -xzf eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz -C /opt
    ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse
}

function add_eclipse_to_main_menu() {
    entering ${FUNCNAME[0]}
    cp eclipse.desktop /usr/share/applications/eclipse.desktop
}

function setup_rime_im() {
    entering ${FUNCNAME[0]}

    # update RIME default config to put Simplified CHN first
    rm -f /usr/share/rime-data/default.yaml
    mv default.yaml /usr/share/rime-data/default.yaml

    # update fcitx profile to enable RIME by default
    rm -f /usr/share/fcitx/configdesc/profile.desc
    mv profile.desc /usr/share/fcitx/configdesc/profile.desc

    # set fcitx trigger key to ALT+LSHIFT
    mkdir -p /etc/skel/.config/fcitx
    echo "[Hotkey]" >> /etc/skel/.config/fcitx/config
    echo "TriggerKey=ALT_LSHIFT" >> /etc/skel/.config/fcitx/config

    # auto start fcitx on a per user basis, so root and kido won't be affected
    mkdir -p /etc/skel/.config/autostart/
    cp /usr/share/fcitx/xdg/autostart/fcitx-autostart.desktop /etc/skel/.config/autostart/
}

function create_desktop_shortcuts() {
    entering ${FUNCNAME[0]}

    mkdir -p /etc/skel/Desktop
    cat >/etc/skel/Desktop/code.desktop <<EOL
[Desktop Entry]
Type=Link
Name=Visual Studio Code
Icon=code
URL=/usr/share/applications/code.desktop
EOL
    cat >/etc/skel/Desktop/eclipse.desktop <<EOL
[Desktop Entry]
Type=Link
Name=Eclipse
Icon=/opt/eclipse/icon.xpm
URL=/usr/share/applications/eclipse.desktop
EOL
    cat >/etc/skel/Desktop/lxterminal.desktop <<EOL
[Desktop Entry]
Type=Link
Name=LXTerminal
Icon=lxterminal
URL=/usr/share/applications/lxterminal.desktop
EOL
    cat >/etc/skel/Desktop/lxterminal.desktop <<EOL
[Desktop Entry]
Type=Link
Name=Firefox Web Browser
Icon=firefox
URL=/usr/share/applications/firefox.desktop
EOL
}

function setup_user_defaults() {
    entering ${FUNCNAME[0]}

    # eclipse shortcut in main menu
    add_eclipse_to_main_menu

    # RIME input method
    setup_rime_im

    # Desktop shortcuts
    create_desktop_shortcuts

    # disable update-notifier for all users
    sed -i 's/KDE;/KDE;LXDE;/' /etc/xdg/autostart/update-notifier.desktop

    # make wifi auto connection available to all users
    sed -i 's/permissions=.*/permissions=/' /etc/NetworkManager/system-connections/*
}

function create_users() {
    entering ${FUNCNAME[0]}
    for username in $users; do
        adduser --disabled-password --gecos "" $username
        echo "$username:$password" | chpasswd
    done
    for username in $admins; do
        adduser --disabled-password --gecos "" $username
        echo "$username:kido2019" | chpasswd
        usermod -G sudo $username
    done
}

function change_kido_passwd() {
    entering ${FUNCNAME[0]}
    echo "kido:kido2019" | chpasswd
}


check_root_or_exit
pushd ~
download_files
disable_auto_update
disable_touchpad
update_apt_sources
install_packages
setup_user_defaults
create_users
change_kido_passwd
popd
echo "搞定啦!!!!!!!!!!"
