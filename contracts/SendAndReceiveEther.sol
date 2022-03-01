// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract SendAndReceiveEther{
    
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    event WithData (uint amount);
    event WithoutData (uint amount);

    modifier onlyOwner(){
        _;
        require(owner == msg.sender, "Only owner can call this function");
        _;
    }

    // Without data
    receive() external payable{
        emit WithoutData(msg.value);
    }

    // With data
    fallback() external payable{
        emit WithData(msg.value);
    }

    function getBalance() external view returns(uint){
        return address(this).balance;
    }

    function sendEtherUsingTransfer(address payable reciever) external onlyOwner{
        uint amount = 1 ether; // 1 wei or 1 gwei
        require(amount <= address(this).balance, "Sorry. Insufficient fund");
        reciever.transfer(amount);
    }

    function sendEtherUsingSend(address payable reciever) external onlyOwner returns(bool){
        uint amount = 1 ether; // 1 wei or 1 gwei
        require(amount <= address(this).balance, "Sorry. Insufficient fund");
        bool sent = reciever.send(amount);
        return sent;
    }

    function sendEtherUsingCall(address payable reciever) external onlyOwner returns(bool){
        uint amount = 1 ether; // 1 wei or 1 gwei
        require(amount <= address(this).balance, "Sorry. Insufficient fund");
        (bool sent, ) = reciever.call{value: amount}("");
        return sent;
    }
}