// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ReferenceType{
    // - storage
    // - memory
    // - calldata

    // Arrays

    // Dynamic array
    uint[] public testArrayDyn;
    string[] public testStringArray;
    // []

    // Static Array
    uint[3] public testArrayStatic;
    // [0, 0, 0]
    // [1, 2, 3] 
    // pop(3) instead of [1,2]
    // [1, 2, 0]

    // push - add a value to the end of the array
    // pop - removes a value from an array
    // length - gets the size
    // delete - removes

    function useStaticArray(uint _value) external returns(uint, uint[3] memory){
        // Push doesn't work here
        testArrayStatic[2] = _value;
        // Pop doesn't work here
        delete testArrayStatic[2];
        uint length = testArrayStatic.length;
        return (length, testArrayStatic);
    }

    function useDynArrayPush(uint _value) external {
        testArrayDyn.push(_value);
    }

    function useDynArrayPop() external {
        // testArrayDyn.pop();
        delete testArrayDyn[1];
    }

    struct User{
        string name;
        uint age;
        string stateOfOrigin;
        string gender;
    }

    User[] public arrayOfUsers;

    function alterStruct
    (
        string memory _name,
        uint _age,
        string memory _stateOfOrigin,
        string memory _gender
    )
    external
    {
        User memory user = User(_name, _age, _stateOfOrigin, _gender);
        arrayOfUsers.push(user);
    }

    // Mapping
    // Bytes
}