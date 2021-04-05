pragma solidity ^0.7.0;

// 1 import smart contract from another file
import 'HelloWorld.sol';


// https://docs.soliditylang.org/en/v0.8.3/contracts.html#events
contract SCInteraction {
    
    // for calling another smart contract function we need:
    // 1) import smart contract
    // 2) address of the smart contract
    // 3) import smart contract interface
    // 4) call another smart contract function
    
    
    // owner of this SC, to be set only via ctor via
    // 'immutable' keyword: Allows exactly one assignment at construction time and is constant afterwards
    address immutable owner;
     
    constructor() {
        owner = msg.sender;
    }
    
    // 2 address of the smart contract
    address private otherSCAddress;
   
    // 2 set the external smart contract address 
    // the contract that has to be called from this one must be deployed before assigning it's address (obviously)
    function setOtherSCAddress(address _otherAddress) external {
        require (msg.sender == owner);
        otherSCAddress = _otherAddress;
    }
    
    function callHelloWorld() external view returns(string memory) {
        
        // 3 import smart contract interface from another file
        IHelloWorld helloWorld = IHelloWorld(otherSCAddress);
        
        // 4 call another smart contract function
        return helloWorld.sayHelloWorld();
    }
}