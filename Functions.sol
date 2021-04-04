pragma solidity ^0.7.0;


// https://docs.soliditylang.org/en/v0.7.4/cheatsheet.html#function-visibility-specifiers
contract Functions {

    // function visibilty specifiers:
    // public: visible externally and internally (creates a getter function for storage/state variables)
    function publicFunc() public {
       
    } 
    // private: only visible in the current contract
    function privateFunc() private { 
        
    } 
    // external: only visible externally (only for functions) - i.e. can only be message-called (via this.func)
    function externalFunc() external { 
        
    } 
    // internal: only visible internally
    function internalFunc() internal {
        
    }


    uint private state;

    // function modifiers:
    // pure: Disallows modification or access of state.
    function pureFunc() public pure {
        uint copyOfState = state;       // error
        state = 1;                      // error
    }
    // view: Disallows modification of state.
    function viewFunc() public view {
        uint copyOfState = state;       // allowed
        state = 1;                      // error
    }
    // payable: Allows them to receive Ether together with a call.
    function payableFunc() public payable {
        state = msg.value;
    }
    // virtual: Allows the function’s or modifier’s behaviour to be changed in derived contracts.
    function virtualFunc() public virtual {
        
    }
    // override: States that this function, modifier or public state variable changes the behaviour of a function or modifier in a base contract.
    function virtualFunc() public override {
        
    }
}