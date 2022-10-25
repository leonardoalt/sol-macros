#!/usr/bin/bash

gcc -E macros/Utils.sol.c > src/Utils.sol
sed -i '/^#/d' src/Utils.sol
forge fmt src/Utils.sol
forge build
