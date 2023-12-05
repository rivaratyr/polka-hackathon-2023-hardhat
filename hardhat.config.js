/** @type import('hardhat/config').HardhatUserConfig */

require('@nomicfoundation/hardhat-ethers');
require('dotenv').config();

const privateKey = process.env.PRIVATE_KEY;

module.exports = {
  solidity: '0.8.19',
  defaultNetwork: 'moonbase',
  networks: {
    moonbase: {
      url: 'https://rpc.api.moonbase.moonbeam.network', // Insert your RPC URL here
      chainId: 1287, // (hex: 0x507),
      accounts: [privateKey],
    },
  },
  
};