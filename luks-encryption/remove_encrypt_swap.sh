#!/bin/bash
echo "enter swap partition"
read currentswap
swapoff /dev/mapper/swapcrypt
cryptsetup luksClose swapcrypt
mkswap currentswap
swapon -a

