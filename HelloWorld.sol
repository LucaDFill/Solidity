pragma solidity ^0.7.0;

// interface to be imported in an external file.
// only interface methods are callable from another smart contract
interface IHelloWorld {
    function sayHelloWorld() external pure returns(string memory);
}

// HelloWorld implements IHelloWorld, overriding it's function
contract HelloWorld is IHelloWorld{
    
    function sayHelloWorld() external pure override returns(string memory) {
        return 'Hello World!';
    }
    
}
