pragma solidity ^0.8.17;

library Events {
    event Transfer(address, address, uint256);
}

function eq(uint256 x, uint256 y) pure returns (bool) {
    return x == y;
}

using {eq} for uint256;

function find(uint256[] memory arr, uint256 elem) pure returns (bool) {
    for (uint256 i = 0; i < arr.length; ++i) {
        if (elem.eq(arr[i])) return true;
    }
    return false;
}

struct Pair {
    uint256 x;
    uint256 y;
}

function eq_pair(Pair memory e1, Pair memory e2) pure returns (bool) {
    return e1.x == e2.x && e1.y == e2.y;
}

using {eq_pair} for Pair;

function find(Pair[] memory arr, Pair memory elem) pure returns (bool) {
    for (uint256 i = 0; i < arr.length; ++i) {
        if (elem.eq_pair(arr[i])) {
            return true;
        }
    }
    return false;
}
