import { ethers, network } from "hardhat";
import fs from "fs";

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log(`Deploying contracts with ${deployer.address} to ${network.name}`);

  const Token = await ethers.getContractFactory("YAFMToken");
  const token = await Token.deploy(deployer.address);
  await token.deployed();
  console.log(`YAFMToken deployed to ${token.address}`);

  const Badge = await ethers.getContractFactory("BadgeNFT");
  const badge = await Badge.deploy(deployer.address, "");
  await badge.deployed();
  console.log(`BadgeNFT deployed to ${badge.address}`);

  const addresses = {
    YAFMToken: token.address,
    BadgeNFT: badge.address,
  };

  const file = `deployed-${network.name}.json`;
  fs.writeFileSync(file, JSON.stringify(addresses, null, 2));
  console.log(`Saved addresses to ${file}`);
}

main().catch((err) => {
  console.error(err);
  process.exitCode = 1;
});
