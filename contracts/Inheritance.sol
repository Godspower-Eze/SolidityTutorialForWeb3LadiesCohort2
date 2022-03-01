// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Father {
    // Characteristics of OOP
    // - inheritance
    // - Encapsulation
    // - Polymorphism 
    // - Abstraction 

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function add(uint num1, uint num2) external pure returns(uint){
        uint sum = num1 + num2;
        return sum;
    }
}