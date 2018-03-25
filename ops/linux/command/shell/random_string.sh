#!/bin/bash

syntax="a-zA-Z0-9@"
length="32"

cat /dev/urandom | tr -dc $syntax |  fold -w $length | head -n 1

# see more: https://www.howtogeek.com/howto/30184/10-ways-to-generate-a-random-password-from-the-command-line/
