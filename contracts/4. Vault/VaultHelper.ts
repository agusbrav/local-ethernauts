import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  //Storage 0 => bool locked
  //Storage 1 => bytes32 password
  const storage = await ethers.provider.getStorageAt(victim.address, 1);
  await victim.unlock(storage)
};

export default helper;
