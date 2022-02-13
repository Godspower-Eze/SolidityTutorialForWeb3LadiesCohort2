// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

contract ValueType{
    // uint
    // int
    // boolean
    // address
    // bytes
    // enums

    // unsigned integer
    uint age = 20;
    uint8 score1 = 255;
    // (2 ** 8) - 1 = 256 - 1 = 255
    uint16 score2 = 40;
    uint24 score3 = 56;
    uint256 score4 = 45;
    // uint is an alias for uint256
    // 11111111 = 255


    // integer
    int temp = -37;
    int8 temp1 = -2;
    int256 temp2 = -55;

    int public min256 = type(int).min;   
    int public max256 = type(int).max;

    int8 public min8 = type(int8).min;   
    int8 public max8 = type(int8).max;

    bool testBool = true;
    bool testBool1 = false;

}