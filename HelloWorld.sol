pragma solidity ^0.7.0;

interface IHelloWorld {
    function sayHelloWorld() external pure returns(string memory);
}

contract HelloWorld is IHelloWorld{
    
    function sayHelloWorld() external pure override returns(string memory) {
        return 'Hello World!';
    }
    
}