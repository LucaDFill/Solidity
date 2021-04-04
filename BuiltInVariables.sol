pragma solidity ^0.7.0;


// https://docs.soliditylang.org/en/v0.7.4/units-and-global-variables.html
contract BuiltInVars {
    
    // ether units
    uint _wei = 1 wei;      // 1
    uint _gwei = 1 gwei;    // 1e9        
    uint _ether = 1 ether;  // 1e18
    
    // time units
    uint _seconds = 1 seconds;
    uint _minutes = 1 minutes;
    uint _hours = 1 hours;
    uint _days = 1 days;
    uint _weeks = 1 weeks;
    
    // Special Variables and Functions
    // There are special variables and functions which always exist in the global namespace 
    // and are mainly used to provide information about the blockchain or are general-use utility functions.
    bytes32 _blockhash          = blockhash(123);               // hash of the given block - only works for 256 most recent, excluding current, blocks
    address payable _coinbase   = block.coinbase;               // current block miner’s address
    uint _difficulty            = block.difficulty;             // current block difficulty
    uint _gasLimit              = block.gaslimit;               // current block gaslimit
    uint _blockNumber           = block.number;                 // current block number
    uint _blockTimestamp        = block.timestamp;              // current block timestamp as seconds since unix epoch
    uint256 _gasLeft            = gasleft();                    // remaining gas
    bytes _calldata             = msg.data;                     // complete calldata
    address payable _sender     = msg.sender;                   // sender of the message (current call)
    bytes4 _signature           = msg.sig;                      // first four bytes of the calldata (i.e. function identifier)
    uint _value                 = msg.value;                    // number of wei sent with the message
    uint _gasPrice              = tx.gasprice;                  // gas price of the transaction
    address payable _txOrigin   = tx.origin;                    // sender of the transaction (full call chain)
    
}