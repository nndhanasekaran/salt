#!/bin/bash

# copy from https://gist.github.com/irazasyed/a7b0a079e7727a4315b9

# PATH TO YOUR HOSTS FILE
ETC_HOSTS=/etc/resolv.conf

# Hostname to add/remove.
DNSIP=8.8.8.8

removehost() {
    echo "removing host";
    if [ -n "$(grep $DNSIP /etc/resolv.conf)" ]
    then
        echo "$DNSIP Found in your $ETC_HOSTS, Removing now...";
        sudo sed -i".bak" "/$DNSIP/d" $ETC_HOSTS
    else
        echo "$DNSIP was not found in your $ETC_HOSTS";
    fi
}

addhost() {
    echo "Adding Google DNS nameserver";
    HOSTS_LINE="nameserver $DNSIP"
    if [ -n "$(grep $DNSIP /etc/resolv.conf)" ]
        then
            echo "$DNSIP already exists : $(grep $DNSIP $ETC_HOSTS)"
        else
            echo "Adding $DNSIP to your $ETC_HOSTS";
            sudo -- sh -c -e "echo '$HOSTS_LINE' >> /etc/resolv.conf";

            if [ -n "$(grep $DNSIP /etc/resolv.conf)" ]
                then
                    echo "$DNSIP was added succesfully \n $(grep $DNSIP /etc/resolv.conf)";
                else
                    echo "Failed to Add $DNSIP, Try again!";
            fi
    fi
}

$@
addhost
