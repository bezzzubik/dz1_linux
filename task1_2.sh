#!/bin/bash

sudo -u user2 cp /opt/hw1/datasets.tar.gz /opt/user2_for_user3/datasets.tar.gz

sudo -u user2 chown user2:user2 /opt/user2_for_user3/datasets.tar.gz

sudo -u user2 chmod 755 /opt/user2_for_user3 && sudo -u user2 chmod 644 /opt/user2_for_user3/datasets.tar.gz