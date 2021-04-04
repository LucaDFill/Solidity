pragma solidity ^0.7.0;


// https://docs.soliditylang.org/en/v0.7.4/types.html
contract Types {
    
    // fixed-size variables
    bool _bool;
    uint _uint;
    address _address;                   // Holds a 20 byte value (size of an Ethereum address).      
    bytes32 _bytes32;
    uint[10] _fixedSizeArray;
    
    // dynamic-size variables
    bytes _bytes;                       // Same as byte[]
    string _string;
    uint[] _dynamicSizeArray;
    mapping(address => uint) _mapping;
    
    // user-defined variables
    struct Struct {
        uint _structUint;
        bool _structBool;
        mapping(address => uint) _structMapping;
    }
    
    enum Enum {
        ENUMITEM1,
        ENUMITEM2
    }
}