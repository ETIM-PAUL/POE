// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract ProofOfExistence {
    // variable for storing hashValue
    bytes32 public hash;

    struct HashedValues {
        bytes32 value;
        address caller;
    }

    //   array that stores all hashed values
    HashedValues[] public hashedValues;

    mapping(bytes32 => bool) isHashed;

    // function that hash value
    function _hashedValue(string memory _value) public returns (bytes32) {
        hash = keccak256(abi.encodePacked(_value));
        hashedValues.push(HashedValues({value: hash, caller: msg.sender}));
        isHashed[hash] = true;
        return hash;
    }

    // function that checks if value exist
    function checkHashed(
        bytes32 _hashedValue
    ) public view returns (bool wasHashed) {
        wasHashed = isHashed[_hashedValue];
    }

    // function that returns all hashed values
    function returnAllHashed() public view returns (HashedValues[] memory) {
        return hashedValues;
    }
}
