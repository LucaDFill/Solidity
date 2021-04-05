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
}