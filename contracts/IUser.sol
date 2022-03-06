// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

interface IUser {

    // Get the name
    function name() external view returns(string memory);

    // Get the age
    function age() external view returns(uint);

    // Get the stateOfOrigin
    function stateOfOrigin() external view returns(string memory);

    // Get userAddress
    function userAddress() external view returns(address);

    // Get the balance
    function balances(string memory _symbol) external view returns(uint);

    // Check is token is added
    function tokenAdded(string memory _symbol) external view returns(bool);

    // Update name
    function updateName(string memory _newName) external;

    // Update age
    function updateAge(uint _newAge) external;

    // Update stateOfOrigin
    function updateStateOfOrigin(string memory _newStateOfOrigin) external;

}