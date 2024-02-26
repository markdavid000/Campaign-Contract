import { ethers } from "hardhat";

async function main() {
  const campaignFactory = await ethers.deployContract("CampaignFactory");

  await campaignFactory.waitForDeployment();

  console.log(
    `Campaign Factory Contract has been deployed to ${campaignFactory.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
