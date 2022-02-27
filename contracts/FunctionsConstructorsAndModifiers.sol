// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract FunctionConstructorsAndModifiers{
    // __init__() in python
    // constructor() in javacsript

    string public name;
    uint public age;

    address public owner;


    constructor(string memory _name, uint _age) {
        name = _name;
        age = _age;
        owner = msg.sender;
    }

    
    modifier onlyOwner(){
        require(owner == msg.sender, "Only owner can call this function");
        _; // Call the function being modified
    }

    // Behaviour Modifiers
    // - pure - Every thing in view does plus you can't values
    // from the storage/state variables
    // - view - In the function you don't alter
    // any value from the storage/state variables

    function testPure() 
    external pure returns(uint)
    {
        // string memory newName = name; // This fails
        uint num = 2 + 2;
        return num;
    }

    function testView() 
    external view returns(string memory)
    {
        return name;
    }

    // Visibility Modifiers
    // - public - Call a function or a variable
    // inside and outside the contract
    // - external - Call a function outside
    // the contract. "this.functionName()"
    // - internal - Call inside a contract and
    // every child
    // - private - Only inside this contract

    function updateName(string memory _name) 
    external onlyOwner
    {
        name = _name;
    }

    function testExternal(string memory _name)
    public {
        // "this" is the contract
        // address(this) returns the address of
        // this contract
        this.updateName(_name);
    }

    function testInternal(uint _age) internal{
        age = _age;
    }


    function testPrivate(uint _age) private{
        age = _age;
    }

}

// contract ChildContract is FunctionConstructorsAndModifiers {

//     function _testInternal(uint _age) public {
//         testInternal(_age);
//     }

//     function _testPrivate(uint _age) public {
//         testPrivate(_age);
//     }
// }