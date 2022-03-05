// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./ISimpleStorage.sol";
import "./AbstractContract.sol";

contract SimpleStorageUser{

    // function add(string memory _name, uint256 _age, string memory _country) external override{

    // }

    function callAdd(address _addr,string memory _name, uint256 _age, string memory _country) external{
        ISimpleStorage(_addr).add(_name, _age, _country);
    }
}