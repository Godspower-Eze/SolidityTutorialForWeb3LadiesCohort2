// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract User {

    // State Variables

    uint id;

    string public name;

    uint public age;

    string public stateOfOrigin; // Camel address

    // string state_of_origin; snake casing

    address public userAddress;

    // Stores balances
    mapping(string => uint) public balances;
    mapping(string => bool) public tokenAdded;

    address public owner;

    // struct
    // struct User{
    //     string name;
    //     uint age;
    //     string stateOfOrigin;
    // }

    // Events
    event NameUpdated(address addr, string newName);
    event AgeUpdated(address addr, uint newAge);
    event StateOfOriginUpdated(address addr, string newStateOfOrigin);
    event TokenAdded(string newToken);

    // Modifier
    modifier onlyOwner(){
        require(msg.sender == owner, "Only ownere can call this function");
        _;
    }

    // Constructor
    constructor(uint _id, string memory _name, uint _age, string memory _stateOfOrigin){
        id = _id;
        name = _name;
        age = _age;
        stateOfOrigin = _stateOfOrigin;
        balances["ETH"] = 10;
        tokenAdded["ETH"] = true;
        balances["BTC"] = 10;
        tokenAdded["BTC"] = true;
        balances["USDT"] = 100000;
        tokenAdded["USDT"] = true;
        userAddress = address(this);
        owner = msg.sender;
    }

    // Functions
    function updateName(string memory _newName) external onlyOwner{
        name = _newName;
        emit NameUpdated(userAddress, name);
    }

    function updateAge(uint _newAge) external onlyOwner{
        age = _newAge;
        emit AgeUpdated(userAddress, age);
    }

    function updateStateOfOrigin(string memory _newStateOfOrigin) external onlyOwner{
        stateOfOrigin = _newStateOfOrigin;
        emit StateOfOriginUpdated(userAddress, stateOfOrigin);
    }

    function addToken(string memory _symbol) external onlyOwner{
        require(!tokenAdded[_symbol], "Token already added");
        balances[_symbol] = 0;
        emit TokenAdded(_symbol);
    }

    function updateBalance(string memory _symbol, uint _balance) external onlyOwner{
        require(tokenAdded[_symbol], "Token not added");
        balances[_symbol] += _balance; // balances[_symbol] = _balance - Bad
    }   

}