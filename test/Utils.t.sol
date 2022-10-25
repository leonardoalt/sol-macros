// SPDX-License-Identifier: GPL-3
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/Utils.sol";

contract UtilsTest is Test {
    function setUp() public {}

    function testFindPair() public {
        Pair[] memory arr = pair_array(10, id);
        assertTrue(find(arr, Pair({x: 7, y: 7})));
    }

    function testFindUInt() public {
        uint256[] memory arr = uint_array(10, double);
        assertTrue(find(arr, 4));
    }

    function pair_array(uint256 n, function (uint) internal pure returns (Pair memory) f)
        internal
        pure
        returns (Pair[] memory)
    {
        Pair[] memory arr = new Pair[](n);
        for (uint256 i = 0; i < n; ++i) {
            arr[i] = f(i);
        }
        return arr;
    }

    function id(uint256 x) internal pure returns (Pair memory) {
        return Pair({x: x, y: x});
    }

    function uint_array(uint256 n, function (uint) internal pure returns (uint) f)
        internal
        pure
        returns (uint256[] memory)
    {
        uint256[] memory arr = new uint[](n);
        for (uint256 i = 0; i < n; ++i) {
            arr[i] = f(i);
        }
        return arr;
    }

    function double(uint256 x) internal pure returns (uint256) {
        return x * 2;
    }
}
