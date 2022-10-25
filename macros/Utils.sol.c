// SPDX-License-Identifier: GPL-3
pragma solidity ^0.8.17;

// This file will be preprocessed with
// gcc -E Utils.sol.c
// generating the final Solidity file.

#define E(name, args...) event name(args);

#define eq_prim(elem_type) function eq(elem_type x, elem_type y) pure returns (bool) { \
    return x == y; \
} \

#define find(arr_type, elem_type, eq_pred) function find(arr_type memory arr, elem_type elem) pure returns (bool) { \
    for (uint i = 0; i < arr.length; ++i) { \
        if (elem.eq_pred(arr[i])) { \
            return true; \
        } \
    } \
    return false; \
} \

library Events {
	// Decl event
	E(Transfer, address, address, uint)
}

// Eq impl for uint
eq_prim(uint)
using {eq} for uint;

// Find impl for uint
find(uint[], uint, eq)

struct Pair {
    uint x;
    uint y;
}

// Eq impl for Pair
function eq_pair(Pair memory e1, Pair memory e2) pure returns (bool) {
    return e1.x == e2.x && e1.y == e2.y;
}
using {eq_pair} for Pair;

// Find impl for Pair
find(Pair[], Pair memory, eq_pair)
