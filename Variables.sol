pragma solidity ^0.7.0;


// https://docs.soliditylang.org/en/v0.7.4/cheatsheet.html#modifiers
contract Variables {

    // variables visibilty specifiers:
    // public: visible externally and internally
    uint public _public;
    
    // automatically creates
    function _public() public view returns(uint) {  // do not compile as this conflicts with an automatically generated function
        return _public;                             // DeclarationError: Identitfier already declared
    }
    function _public(uint p) public {               // do not compile as this conflicts with an automatically generated function
        _public = p;                                // DeclarationError: Identitfier already declared
    }    
    
    // private: only visible in the current contract
    uint private _private;
    
    // internal: only visibile in the current smart contract and contracts inheriting from this 
    uint _default;                                  // default = internal
    uint internal _internal;
    
    // variables modifiers:
    // constant: Disallows assignment (except initialisation), does not occupy storage slot.
    uint constant _constant = 1;                
    function func(uint c) public {
        _constant = c;                              // error
    }
    // immutable: Allows exactly one assignment at construction time and is constant afterwards. Is stored in code.
    uint immutable _immutable;
    
    constructor(uint i) {
        _immutable = i;                             // allowed
    }
    function immFunc(uint i) public {
        _immutable = i;                             // error
    }
}