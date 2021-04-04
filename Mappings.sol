pragma solidity ^0.7.0;


// https://docs.soliditylang.org/en/v0.7.4/types.html#mapping-types
contract Mappings {

    // is not possibile to iterate directly a mapping
    // can be done combining an array to keep track of the indexing
    // can only be instanced on storage, not memory
    mapping (address => uint) balances;             // it's like a c# dictionary<address, uint> in this case
    
    function  alterMapping() external payable {
        
        // add
        balances[msg.sender] = msg.value;
        
        // read
        uint sentVal = balances[msg.sender];
        
        // update 
        balances[msg.sender] = 1;
        
        // delete
        delete balances[msg.sender];
        
        // default value of entries no present in mapping will return the corrisponding default value
        uint nonExisting = balances[address(0)];    // 0 
    }
    
    
    // nested mapping
    mapping(address => mapping(address => bool)) nestedMapping;
    
    function alterNestedMapping(address _spender) external {
        
        // add 
        nestedMapping[msg.sender][_spender] = true;
            
        // read
        bool isOk = nestedMapping[msg.sender][_spender];
        
        // update 
        nestedMapping[msg.sender][_spender] = false;
        
        // delete
        delete nestedMapping[msg.sender][_spender];
    }
    
    
    // mapping to array
    mapping(address => uint[]) mapToArr;        // no need to initialize the inner array 
                                                // since in mapping every value is at default value
    function alterMapToArr() external {
        
        // add 
        mapToArr[msg.sender].push(1);
            
        // read
        uint sentVal = mapToArr[msg.sender][0];
        
        // update 
        mapToArr[msg.sender][0] = 2;
        
        // delete
        mapToArr[msg.sender].pop();
        delete mapToArr[msg.sender][0];
    }
}