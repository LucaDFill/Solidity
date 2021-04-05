pragma solidity ^0.7.0;


contract Errors{
    
    // when an error occurs, every change made previosly by the transaction is reverted to it's precedent state
    // consuming all or a part (when not all contract function is executed) of the gas provided
    
    // different ways for causing an error:
    // 1) throw -> deprecated
    // 2) revert(string memory message) 
    // 3) require(bool condition, string memory message)
    // 4) assert(bool condition)
    // 5) error in another smart contract call
    
    function errorTriggeringFunc() external payable {
        
        // 2) revert
        if (msg.value < 1 ether) {
            revert('Insufficient ether sent');
        }
        
        // 3) require
        // tests for a condition that CAN occurr in the logic of the smart contract
        require(msg.value >= 1 ether, 'Insufficient ether sent');
        
        // 4) assert
        // tests for a condition that should NEVER occurr in the logic of the smart contract
        assert(msg.value >= 1 ether);               // this will throw with 'VM error: invalid opcode.' message
                                                    // since this was introduced when there wasn't an opcode for errors
                                                
        // 5) error in another smart contract
        Throwable throwable = new Throwable();
        throwable.throwAnError();                   // the error will propagate into the calling contract
        
        // 5b) a way to manage errors propagating from another smart contract
        // call is a low-level way of calling smart contracts, vulnerable to re-entrancy attack. 
        // https://quantstamp.com/blog/what-is-a-re-entrancy-attack (DAO-hack)
        // avoid if possibile
        // forwards all remaining gas by default
        (bool success, ) = address(throwable).call(abi.encodePacked("throwAnError()"));
        if (!success) {
            revert('Message from an error in Throwable smart contract'); 
        }
    }
}

contract Throwable{
    
    // this function will throw an error
    function throwAnError() external pure {
        revert('Message from an error in Throwable smart contract');
    }
    
}