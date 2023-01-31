#!/bin/bash

## Variables definition
SCRIPT_FILENAME="/tmp/bootstrap-salt.sh"
MASTER_OPTS="-F -M -N"
PACKAGES=(curl wget)
MINION_DIR="/vagrant/keys/minions"
MINIONS=("worker1" "worker2" "worker3" "lb1" "lb2")
SALT_MASTER_PKI_ROOT="/etc/salt/pki/master"
SALT_MINION_PKI_ROOT="/etc/salt/pki/minion"
SALT_BOOTSTRAP_URL="https://bootstrap.saltproject.io/"


do_cleanup() {
    sudo rm -rf "$MINION_DIR"
}

install_packages() {
    sudo apt-get install -yq "${@}"
}


download_bootstrap() {
    sudo curl -L -q -o "$SCRIPT_FILENAME" "$1" && sudo chmod +x $SCRIPT_FILENAME
}

install_salt_master() {
    sudo "$SCRIPT_FILENAME" $MASTER_OPTS "${@}"
}

install_salt_minion() {
    sudo "$SCRIPT_FILENAME" -i "$1" -A "$2"
}

restart_salt_master() {
    sudo systemctl restart salt-master
}

restart_salt_minion() {
    sudo systemctl restart salt-minion
}

generate_minion_keys() {
    do_cleanup

    sudo mkdir -p "$MINION_DIR"

    for node in "${MINIONS[@]}";
    do
            NODE_DIR="$MINION_DIR/$node"
            sudo mkdir -p "$NODE_DIR"
            sudo salt-key --gen-keys-dir "$NODE_DIR" --gen-keys="$node"
    done
}

copy_keys_to_master () {
    sudo rm -rf "$SALT_MASTER_PKI_ROOT/minions_denied"
    sudo rm -rf "$SALT_MASTER_PKI_ROOT/minions_rejected"

    for pub_key in $(find "$MINION_DIR" -type f -iregex .+\.pub)
    do
        sudo cp "$pub_key" $SALT_MASTER_PKI_ROOT/minions/$(basename "${pub_key//\.pub}")
    done
}

copy_keys_to_minion() {
    KEYS_DIR="$MINION_DIR/$1"

    MINION_PUB_PATH="$SALT_MINION_PKI_ROOT/minion.pub"
    MINION_KEY_PATH="$SALT_MINION_PKI_ROOT/minion.pem"

    sudo rm -f "$MINION_PUB_PATH"
    sudo rm -f "$MINION_KEY_PATH"

    sudo find "$KEYS_DIR" -type f -iname *.pub -exec cp {} "$MINION_PUB_PATH" \;
    sudo find "$KEYS_DIR" -type f -iname *.pem -exec cp {} "$MINION_KEY_PATH" \;

    sudo chmod 0644 "$MINION_PUB_PATH"
    sudo chmod 0400 "$MINION_KEY_PATH"
}

ARGS="$@"
ARGS_COUNT="${#@}"

if [[ "$ARGS_COUNT" -lt "1" ]];
then
    cat <<EOF
salt.sh 0.1.0 
Usage: salt.sh command

salt.sh is a simple script to bootstrap salt with VMs

Most used commands:
  master - install salt master and generate keys
  minion NAME -  install salt minion and copy keys
EOF
fi

CMD="$1"

case "$CMD" in
    master)
        install_packages "${PACKAGES[@]}"
        download_bootstrap "$SALT_BOOTSTRAP_URL"
        install_salt_master
        generate_minion_keys
        copy_keys_to_master
        restart_salt_master
        exit 0
    ;;

    minion)
        install_packages "${PACKAGES[@]}"
        download_bootstrap "$SALT_BOOTSTRAP_URL"
        install_salt_minion "$2" "$3"
        copy_keys_to_minion "$2"
        restart_salt_minion
        exit 0
    ;;
esac;

# copy_keys_to_master