// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MultiSigWallet {
    event Deposit(address sender, uint amount, uint balance);
    event Submit(address submitter, uint txId);
    event Approval(address approver, uint txId);
    event Execute(address executer, uint txId);
    event Sent(address receiver, uint amount);

    uint public required;

    address[] public owners;
    mapping (address => bool) public isOwner;

    modifier onlyOwner(){
        require(isOwner[msg.sender], "Only owner can call function");
        _;
    }

    modifier isNotApproved(uint txId){
        require(!approved[txId][msg.sender], "You have already approved");
        _;
    }

    modifier transactionExists(uint txId){
        require(transactionExist[txId], "Transaction does not exist");
        _;
    }

    modifier isNotExecuted(uint txId){
        Transaction memory transaction = transactions[txId];
        require(!transaction.executed, "Transaction already executed");
        _;
    }

    uint public transactionCount;

    struct Transaction {
        address receiverAddress;
        uint amount;
        uint confirmations;
        bool executed;
    }

    mapping(uint => Transaction) public transactions;
    mapping(uint => bool) public transactionExist;

    mapping(uint => mapping(address => bool)) approved; 

    constructor(address[] memory _addresses, uint _required){
        require(_addresses.length >= 3, "Owners arrays is too short");
        require(_required == _addresses.length - 1,
         "Length of addreses minus 1 must be equal to _required"
        );
        required = _required;
        // A check than makes sure that addresses are unique
        for(uint i; i < _addresses.length; i++){
            owners.push(_addresses[i]);
            isOwner[_addresses[i]] = true;
        }
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

    function submit(address _to, uint _amount) external onlyOwner{
        // msg.value - Ether sent with transaction
        require(address(this).balance >= _amount, "Insufficient funds");
        transactionCount ++;
        transactions[transactionCount] = Transaction(_to, _amount, 0, false);
        transactionExist[transactionCount] = true;
        emit Submit(msg.sender, transactionCount);
    }

    function approve(uint txId) external onlyOwner transactionExists(txId) isNotApproved(txId) isNotExecuted(txId){
        approved[txId][msg.sender] = true;
        Transaction storage transaction = transactions[txId];
        transaction.confirmations ++;
        emit Approval(msg.sender, txId);
    }

    function execute(uint txId) external onlyOwner transactionExists(txId) isNotExecuted(txId){
        Transaction storage transaction = transactions[txId];
        require(transaction.amount <= address(this).balance, "Insufficienf fund");
        require(transaction.confirmations >= required,
        "Transation not fully approved");
        transaction.executed = true;
        (bool success, ) = transaction.receiverAddress.call{value: transaction.amount}("");
        require(success, "Transaction unsuccessful");
        emit Sent(transaction.receiverAddress, transaction.amount);
    }

    function getBalance() external view onlyOwner returns(uint balance){
        balance = address(this).balance;
    }
}