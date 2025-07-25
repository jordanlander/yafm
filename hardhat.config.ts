
import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import * as dotenv from "dotenv";

dotenv.config();

const { PRIVATE_KEY, MAINNET_RPC_URL, SEPOLIA_RPC_URL } = process.env;

const accounts = PRIVATE_KEY ? [PRIVATE_KEY] : [];

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  networks: {
    sepolia: {
      url: SEPOLIA_RPC_URL || "",
      accounts,
    },
    mainnet: {
      url: MAINNET_RPC_URL || "",
      accounts,
    },
  },
};

export default config;
