pragma solidity ^0.7.0;


// https://docs.soliditylang.org/en/v0.7.4/types.html#arrays
contract Arrays {

    // storage Arrays
    uint[] private _dynamicSizeArray;
    uint[10] private _fixedSizeArray;
    
    function manageStorageArrays(uint _val) external {
        
        // add
        _dynamicSizeArray.push(_val);   // Increasing the length of a storage array by calling push() has constant gas costs because storage is zero-initialised
        // none for _fixedSizeArray     // Length cant't be increased as it's fixed size
        
        // read
        uint val = _dynamicSizeArray[0];
        val = _fixedSizeArray[0];
    
        // update
        _dynamicSizeArray[0] = _val;
        _fixedSizeArray[0] = _val;
        
        // delete
        _dynamicSizeArray.pop();        // remove last element in array reducing its length. 
                                        // Decreasing the length by calling pop() has a cost that depends on the “size” of the element being removed. 
                                        // If that element is an array, it can be very costly, because it includes explicitly clearing the removed elements similar to calling delete on them
        delete _dynamicSizeArray[0];    // this set _dynamicSizeArray[0] to uint default value: 0
        
        // _fixedSizeArray.pop();       // error
        delete _fixedSizeArray[0];      // this set _fixedSizeArray[0] to uint default value: 0
        
        // iterate
        for (uint i = 0; i < _dynamicSizeArray.length; ++i) {
            // access at index
            _dynamicSizeArray[i];       // do something
            _fixedSizeArray[i];         // do something
        }
    } 
    
    // memory Arrays
    function manageMemoryArrays(uint _val) external pure {
        
        // can't have a dynamic size memory array, length must be specified and arrays initialized with 'new' keyword
        uint[] memory _memoryArray = new uint[](10);
        
        // add
        // _memoryArray.push(_val);     // error
        // none for _memoryArray        // Length cant't be increased as it's fixed size
        
         // read
        uint val = _memoryArray[0];

        // update
        _memoryArray[0] = _val;

        // delete
        // _memoryArray.pop();          // error
        delete _memoryArray[0];         // this set _memoryArray[0] to uint default value: 0
        
        // iterate
        for (uint i = 0; i < _memoryArray.length; ++i) {
            // access at index
            _memoryArray[i];            // do something
        }
    }
    
    // arrays as function parameter
    // must be used in conjuction with 'calldata' or 'memory' key to specify that the array will be read from data paramters
    function manageFuncArrays(uint[] calldata _arr) external {
        // do something
    }
    function manageFuncArrays2(uint[] memory _arr) public {
        // do something
    }
    
    // return an array
    // must be returned with 'calldata' or 'memory' key 
    // memory arrays can be return if create into the function
    function returnArray() external pure returns(uint[] memory) {
        // do something
        return new uint[](10);
    }
    // calldata arrays must be taken from function parameter
    function returnArray2(uint[] calldata arr) external pure returns(uint[] calldata) {
        // do something
        return arr;
    }
}