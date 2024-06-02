//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract safemath{
    uint8 public bignumber = 255;
    function add() public {
        unchecked{bignumber = bignumber+1;}
    }
}

