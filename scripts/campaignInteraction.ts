import { ethers } from "hardhat";

const main = async () => {
  const campaign = "0xb5a5d729AcE512971e3096B7f20cfC45093B274d";
  const CAMPAIGN = await ethers.getContractAt("Campaign", campaign);

  const AmountToContribute = ethers.parseEther("5");

  const contributeTx = await CAMPAIGN.contribute({ value: AmountToContribute });

  await contributeTx.wait();
  console.log(contributeTx);
};

main().catch((error) => {
  console.log(error);
  process.exitCode = 1;
});

// ------------TRANSACTION HASH------------- \\
// 0xdcc507e6cc1cff68ead20e452909c4f9d2b5782279de57d173cd9cb06c0c9c47
