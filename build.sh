#!/usr/bin/bash

gcc -E macros/Utils.sol.c > src/Utils.sol
sed -i '/^#/d' src/Utils.sol
sed -i '1 i\// THIS SOLIDITY SOURCE IS AUTO-GENERATED FROM `macros/Utils.sol.c`.' src/Utils.sol
sed -i '1 i\// SPDX-License-Identifier: GPL-3' src/Utils.sol
forge fmt src/Utils.sol
forge build
