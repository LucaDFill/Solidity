pragma solidity ^0.7.0;

contract Parent {
    
    uint private parentData;
    
    constructor(uint _data) {
        parentData = _data;
    }
    
    // a public or internal function can be called from an inheriting contract
    function getParentData() internal view returns(uint) {    
        return parentData;
    }
}

contract AnotherParent {
    
    // default: internal
    uint anotherParentData;
    
    constructor(uint _data) {
        anotherParentData = _data;
    }
}

// inheriting from another contract let this contract have access to:
// inherited state variables with internal or public visibility
// inherited functions with internal or public visibility
contract Child is Parent, AnotherParent {
    
    // must call inherited constructors
    constructor(uint _data) Parent(_data) AnotherParent(_data) {
        
    }
    
    function getDataFromParent() external view returns(uint) {
        
        // doesn't work since parentData is private
        //return parentData;          
        
        // must call parentData getter
        return getParentData();
    }
    
    function getDataFromAnotherParent() external view returns(uint) {
        
        // works since anotherParentData is internal (default visibility)
        return anotherParentData;   
    }
}