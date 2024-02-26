import { ethers } from "hardhat";

const main = async () => {
  const goal = ethers.parseEther("5");
  const duration = 5;
  const recipient = "0x802Da5c76521317f2cC9d6eBad176e47A5F4205c";

  const campaignFactory = "0xe5665A69afA64028837B36632636E97CA8d7C59b";
  const CAMPAIGNFACTORY = await ethers.getContractAt(
    "CampaignFactory",
    campaignFactory
  );

  const createCampaignTx = await CAMPAIGNFACTORY.createCampaign(
    goal,
    duration,
    recipient
  );

  await createCampaignTx.wait();

  const getDeployedCampaigns = await CAMPAIGNFACTORY.getDeployedCampaigns();
  console.log(getDeployedCampaigns);
};

main().catch((error) => {
  console.log(error);
  process.exitCode = 1;
});

// ------------TRANSACTION HASH------------- \\
// 0xca0315b096302e4ed6079132b2a61d36102c434f1a79f225df7701bcccdd1714
