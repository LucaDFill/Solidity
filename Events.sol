pragma solidity ^0.7.0;


// https://docs.soliditylang.org/en/v0.8.3/contracts.html#events
contract Events {
    
    // events are used to communicate outside and can't be read by a smart contract
    // and are less gas expensive than storage variables
    
    // declare the Events
    event NewEvent(
            uint date,
            address from,
            address to,
            uint amount
        );
        
    // 'indexed' keyword is used to filter events base on that parameter
    // maximum can be used 3 'indexed' keyword for an event
    // adding one or more 'indexed' parameters make the contract more expensive to run
    event NewIndexedEvent(
            uint date,
            address indexed from,
            address to,
            uint amount
        );
    
    function send(address to, uint amount) external {
        
        // emit a new event
        emit NewEvent(block.timestamp, msg.sender, to, amount);
        
        emit NewIndexedEvent({
            date: block.timestamp,
            from: msg.sender,
            to: to,
            amount: amount
        });
    }
}