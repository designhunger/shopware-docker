#!/usr/bin/env bash

if grep -q "__SW_HOST__" /etc/hosts;
    then
        echo "__SW_HOST__ already exists";
    else
        echo "Adding __SW_HOST__ to your /etc/hosts";
        sudo -- sh -c -e "echo '127.0.0.1\t__SW_HOST__' >> /etc/hosts";

        if grep -q "__SW_HOST__" /etc/hosts;
            then
                echo "__SW_HOST__ was added succesfully \n$(grep __SW_HOST__ /etc/hosts)";
            else
                echo "Failed to add __SW_HOST__. Try again!";
            fi
    fi
