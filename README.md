# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.ts
```

## Deployment

The project uses environment variables to manage network RPC URLs and accounts. Create a `.env` file at the project root with the following keys:

```dotenv
SEPOLIA_URL=
SEPOLIA_PRIVATE_KEY=
MAINNET_URL=
MAINNET_PRIVATE_KEY=
```

To deploy `YAFMToken` and `BadgeNFT` run:

```shell
# Example: deploy to Sepolia
npx hardhat run scripts/deploy.ts --network sepolia
```

The script saves the addresses to `deployed-sepolia.json` (or `deployed-mainnet.json`).

## Deployed Contracts (Local)

- **YAFMToken**: 0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9  
- **BadgeNFT**:  0x5FC8d32690cc91D4c39d9d3abcBD16989F875707  

