// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

interface ISimpleStorage {
    struct Users{
        string name;
        uint age;
    }

    event UserAdded(address user);

    enum Gender{
        Male,
        Female
    }

    function add(string memory _name, uint256 _age, string memory _country) external;
}