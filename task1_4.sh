#!/bin/bash

TEMP_LOG=$(mktemp)

eval "$(ssh-agent -s)" >/dev/null

for key in /opt/hw1/keys/*; do
    ssh-add "$key" 2>/dev/null
done

ssh -v -o StrictHostKeyChecking=no -o PasswordAuthentication=no user4@$MASTER_SERVER -p 22 -E $TEMP_LOG exit

eval "$(ssh-agent -k)" >/dev/null

TARGET_PUBKEY=$(cat $TEMP_LOG | grep -E "Server accepts key: key RSA SHA256:.+\sagent" | awk '{print $7}')

for key in /opt/hw1/keys/*; do
    if [[ "$(ssh-keygen -lf "$key" | awk '{print $2}')" == "$TARGET_PUBKEY" ]]; then
        FILE_KEY="$key"
        break
    fi
done


echo "$FILE_KEY" | grep -E -o "key_[0-9]+" | grep -E -o "[0-9]+"

ssh-keygen -E md5 -lf "$FILE_KEY" | awk '{print $2}'