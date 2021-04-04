pragma solidity ^0.7.0;


// https://docs.soliditylang.org/en/v0.7.4/types.html#structs
contract Structs {

    // declare a struct
    struct User {
        address addr;
        uint amount;
        bool allowed;
        string name;
    }
    
    
    function manageStruct(string calldata _name) external {
        
        // memory stuct
        // define a new struct 
        User memory user = User(msg.sender, 0, false, _name);   // parameters must be in the same order as the definition
        
        User memory user1 = User({                              // parameters are named and can be in any order
            addr: msg.sender,
            allowed: true,
            name: _name,
            amount: 0
        });
        
        // access 
        uint amount = user.amount;
        bool allowed = user1.allowed;
        
        // update
        user.amount = amount;
        user1.allowed = false;
        
        // delete 
        delete user;
        delete user1;
    }
    
    
    // storage struct array
    User[] users;
    
    function manageStructArr(string calldata _name) external {
        
        User memory user = User({                            
            addr: msg.sender,
            allowed: true,
            name: _name,
            amount: 0
        });
        
        // add
        users.push(user);
        
        users.push(User({
            addr: msg.sender,
            allowed: true,
            name: _name,
            amount: 0
        }));
        
        // access
        User memory u = users[0];
        
        // update
        users[0].allowed = true;
        
        // delete
        users.pop();
        delete users[0];
    }
    
    
    // storage mapping struct
    mapping(address => User) userMapping;
    
    function manageStructMapping(string calldata _name) external {
        
         User memory user = User({                             
            addr: msg.sender,
            allowed: true,
            name: _name,
            amount: 0
        });
        
        // add
        userMapping[msg.sender] = user;
        
        userMapping[msg.sender] = User({
            addr: msg.sender,
            allowed: true,
            name: _name,
            amount: 0
        });
        
        // access 
        User memory u = userMapping[msg.sender];
        
        // update 
        userMapping[msg.sender].allowed = false;
        
        // delete
        delete userMapping[msg.sender];
    }
}
