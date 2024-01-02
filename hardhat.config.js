/** @type import('hardhat/config').HardhatUserConfig */

require('@nomicfoundation/hardhat-ethers');
require("@nomicfoundation/hardhat-verify");
require('dotenv').config();

const privateKey = process.env.PRIVATE_KEY;
const ETHERSCAN_KEY = process.env.ETHERSCAN_KEY;

module.exports = {
  solidity: '0.8.20',
  defaultNetwork: 'moonbase',
  networks: {
    moonbase: {
      url: 'https://rpc.api.moonbase.moonbeam.network', // Insert your RPC URL here
      chainId: 1287, // (hex: 0x507),
      accounts: [privateKey],
    },
  },
  etherscan: {
    apiKey: {
      moonbase: ETHERSCAN_KEY,
    },
    customChains: [
      {
        network: "moonbase",
        chainId: 1287,
        urls: {
          apiURL: "https://api-moonbase.moonscan.io/api",
          browserURL: "https://moonbase.moonscan.io"
        }
      },
    ]
  }
  
};