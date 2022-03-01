// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Events {

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    event Added (uint num1, uint num2);

    event Approval (address indexed caller, address indexed owner);

    function add(uint num1, uint num2) external returns(uint){
        uint sum = num1 + num2;
        emit Added(num1, num2);
        return sum;
    }

    function approve() external{
        emit Approval(msg.sender, owner);
    }
}
