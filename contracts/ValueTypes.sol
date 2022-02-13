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

    // address and address payable
    // a 20-byte hexadecimal number
    // Hex: 123456789ABCDEF
    address testAddr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    address payable testAddr2 = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);

    // bytes1, bytes2, bytes3 => bytes32

    bytes1 public testBytes = "W"; 
    bytes2 public testBytes1 = "er";
    bytes32 public testBytes32 = "FGGGSS";

    enum UserType {
        ADMIN,
        SUBADMIN,
        NORMALUSER
    }

    // function testEnums() external pure returns(UserType, UserType, UserType){
    //     UserType admin = UserType.ADMIN;
    //     UserType subadmin = UserType.SUBADMIN;
    //     UserType normaluser = UserType.NORMALUSER;
    //     return (admin, subadmin, normaluser);
    // }
    // function seeAttributes(address addr) external view returns(uint){
    //     uint balance = addr.balance;
    //     return balance;
    // }

    // function seeContractAddressAndBalance() external view returns(address, uint){
    //     address contractAddress = address(this);
    //     uint balance = contractAddress.balance;
    //     return (contractAddress, balance);
    // }

    // let stringNum = "12"
    // let toInt = parseInt(stringNum)

    // 1 ether = 1,000,000,000,000,000,000 wei
    // 1 ether = 1,000,000,000 gwei
}