# Setup

- Basic setup for Moonbeam: https://docs.moonbeam.network/builders/build/eth-api/dev-env/hardhat/
- Use Node 18: `nvm use 18`
- Install Open Zeppelin contracts: `npm install --save-dev @openzeppelin/contracts`
- Latest Open Zeppeling docs: https://docs.openzeppelin.com/contracts/5.x/erc721 
- Get DEV: https://faucet.moonbeam.network/ 

# Compile
`npx hardhat compile`

# Deploy
`npx hardhat run --network moonbase scripts/deploy.js`

# Check 
https://moonbase.moonscan.io/ 

# Verify
https://hardhat.org/hardhat-runner/plugins/nomicfoundation-hardhat-verify 

Example: `npx hardhat verify 0x8f1339Aa6e140b70497D9B48cd0fe7168CB0E5a7 "0xE6908294fE2C9D22e50daA50177D9fd15a93B952"`