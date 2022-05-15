const helper = async (victim: any, attacker: any) => {
  /*
  * Loop 10 times the hackContract function.
  * Since default config in hardhat node mines the block after tx
  * we dont have to worry about waiting for next block.
  */
  for (let i=0; i<10; i++){
    await attacker.hackContract();
  }
};

export default helper;
