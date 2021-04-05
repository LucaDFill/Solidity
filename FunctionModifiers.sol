pragma solidity ^0.7.0;


contract FunctionModifiers{
    
    address private immutable owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    
    // declare a modifier 
    // _; represents a placeholder for the rest of the function 
    modifier ownerOnly() {
        require(msg.sender == owner, 'Not the owner');
        _;
    }
    
    modifier validTransaction() {
        require (msg.value > 1 gwei, 'Invalid amount');
        _;
    }
    
    modifier validAmount(uint amount) {
        require (amount >= 10 , 'Too small amount');
        _;
    }
    
    function aFunc(uint anUint) external payable ownerOnly() validTransaction() validAmount(anUint) returns(uint) {
        
        // the modifier ownerOnly will be called here
        // require(msg.sender == owner, 'Not the owner');
        
        // the modifier validTransaction will be called after ownerOnly
        // require (msg.value > 1 gwei, 'Invalid amount');
        
        // the modifier validAmount will be called after validTransaction
        //require (anUint >= 10 , 'Too small amount');
        
        // now will execute the function body
        return (address(this).balance);
    }
}
