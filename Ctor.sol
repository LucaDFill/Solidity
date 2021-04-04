pragma solidity ^0.7.0;

// https://docs.soliditylang.org/en/v0.7.4/contracts.html
// A constructor is optional. Only one constructor is allowed
contract Constructor {
    
    // storage vars
    uint private uint1;
    address private owner; 
    
    // ctor declaration,
    // visibility for ctor is ignored
    constructor(uint _uint1) {
        owner = msg.sender;
        uint1 = _uint1;
    }
}