#!/bin/bash

host=${HOSTNAME}
port=${PORT}

nmap -n "${host}.1"/24 -p "${port}"
