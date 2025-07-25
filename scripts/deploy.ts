import { ethers } from "hardhat";

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with:", deployer.address);

  const Token = await ethers.getContractFactory("YAFMToken");
  const token = await Token.deploy(deployer.address);
  await token.waitForDeployment();
  console.log("YAFMToken deployed to:", await token.getAddress());

  const Badge = await ethers.getContractFactory("BadgeNFT");
  const badge = await Badge.deploy(deployer.address, "https://example.com/");
  await badge.waitForDeployment();
  console.log("BadgeNFT deployed to:", await badge.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
