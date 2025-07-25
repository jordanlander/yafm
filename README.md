# YAFM Hardhat Project

This repository contains the YAFMToken ERC20 and BadgeNFT ERC721 contracts built with [Hardhat](https://hardhat.org/).

## Requirements

- Node.js 18 or higher
- npm

## Setup

1. Install dependencies:

```bash
npm install
```

2. Copy the example environment file and populate the variables:

```bash
cp .env.example .env
```

Edit `.env` and provide RPC endpoints and the private key of the deployer account.

3. Run the test suite to make sure everything is working:

```bash
npx hardhat test
```

## Deployment

### Local development network

Start a local node and deploy the contracts:

```bash
npx hardhat node
npx hardhat run scripts/deploy.ts --network localhost
```

### Testnet/Mainnet

With your `.env` configured, deploy to a public network:

```bash
# Deploy to Sepolia (or your configured testnet)
npx hardhat run scripts/deploy.ts --network sepolia

# Deploy to mainnet
npx hardhat run scripts/deploy.ts --network mainnet
```

The deployed contract addresses will be shown in the console after each deployment.

## Deployed Contracts (Local)

- **YAFMToken**: 0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9
- **BadgeNFT**:  0x5FC8d32690cc91D4c39d9d3abcBD16989F875707
