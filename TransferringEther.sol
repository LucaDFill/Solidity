pragma solidity ^0.7.0;


contract TransferringEther{
    
    // send ether to another address
    // an address that has to recieve ether must be payable
    // this type has an builtin function called transfer that accept an amount (uint) as arg
    function sendEther(address payable to, uint amount) external {
        
        to.transfer(amount);    //  amount is in  wei
    }
    
    // recieve ether on the smart contract
    // only a payable function can recieve ether 
    function recieveEther() external payable {
        
        uint amountSent = msg.value;                // amount in wei transferred
        uint scBalance = address(this).balance;     // smart contract balance in wei
    }
    
    // another candidate for receiving ether 
    // if no function is called and ether is sent to the smart contract this function will be called
    
    // https://docs.soliditylang.org/en/v0.8.3/contracts.html#receive-ether-function
    // This function cannot have arguments, cannot return anything and must have external visibility and payable state mutability. 
    // It can be virtual, can override and can have modifiers.
    receive() external payable {
        
        uint amountSent = msg.value;                // amount in wei transferred
        uint scBalance = address(this).balance;     // smart contract balance in wei
    }
    
    // if recieve() external payable is NOT defined
    // but is defined a fallback() external payable function, this will be triggered
    fallback() external payable {
        
        uint amountSent = msg.value;                // amount in wei transferred
        uint scBalance = address(this).balance;     // smart contract balance in wei
    }
}
