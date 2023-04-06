// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract ProofOfExistence {
    // variable for storing hashValue
    string public hashValue;
    string public hash;
    uint8 public initializer;
    string[] public hashedValues;

    uint hashDigits = 8;

    // Equivalent to 10^8 = 8
    uint hashModulus = 10 ** hashDigits;

    function calculate(string memory _value) public view returns (uint) {
        hash = uint(keccak256(abi.encodePacked(_value))) % hashModulus;
        hashedValues.push(hash);
        return hash;
    }

    function checkHashed(
        string memory _hashedValue
    ) public view returns (bool) {
        if (hashedValues.includes(_hashedValue)) {
            return true;
        } else {
            return false;
        }
    }
}
