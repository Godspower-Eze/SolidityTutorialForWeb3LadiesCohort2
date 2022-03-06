// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./User.sol";
import "./IUser.sol";

contract Manager{

    address public owner;
    uint public usersCount;

    // Constructor
    constructor(){
        owner = msg.sender;
    }

    // Struct
    struct UserContracts{
        address addr;
        uint id;
        string name;
        uint age;
        string stateOfOrigin;
    }

    // Event
    event Created(address addr, string _name, uint _age, string _stateOfOrigin);

    // Mapping
    mapping(address => UserContracts) public users;
    mapping(address => bool) public userAdded;

    // Modifier
    modifier onlyOwner(){
        require(msg.sender == owner, "Only ownere can call this function");
        _;
    }

    // Functions
    function create(string memory _name, uint _age, string memory _stateOfOrigin) external onlyOwner{
        usersCount += 1;
        User _user = new User(usersCount, _name, _age, _stateOfOrigin);
        users[address(_user)] = UserContracts(address(_user), usersCount, _name, _age, _stateOfOrigin);
        userAdded[address(_user)] = true;
        emit Created(address(_user), _name, _age, _stateOfOrigin);
    }

    function getName(address _addr) external view onlyOwner returns(string memory){
        require(userAdded[_addr], "User does not exist");
        string memory _userName = IUser(_addr).name();
        return _userName;
    }

    function getBalance(address _addr, string memory _symbol) external view onlyOwner returns(uint){
        require(userAdded[_addr], "User does not exist");
        uint balance = IUser(_addr).balances(_symbol);
        return balance;
    }

    function updateName(address _addr, string memory _newName) external {
        require(userAdded[_addr], "User does not exist");
        IUser(_addr).updateName(_newName);
    }
}