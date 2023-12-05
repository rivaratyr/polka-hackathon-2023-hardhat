// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

/**
* @title Vote
* @dev Implements voting leverage functionality only
*/
contract Vote {

    address public owner;
    
    mapping(address => uint) private values;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function storeValue(address _address, uint _value) public onlyOwner {
        values[_address] = _value;
    }

    function retrieveValue(address _address) public view returns (uint) {
        return values[_address];
    }

    function changeOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}
