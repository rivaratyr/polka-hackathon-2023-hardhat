// scripts/deploy.js
async function main() {
    // Get the contract to deploy
    const contract = await ethers.getContractFactory('HackathonHungary2023PoP');
    console.log('Deploying...');
  
    // Instantiate a new smart contract
    const deploying = await contract.deploy("0xE6908294fE2C9D22e50daA50177D9fd15a93B952");
  
    // 3. Wait for the deployment to resolve
    await deploying.waitForDeployment();
  
    // 4. Use the contract instance to get the contract address
    console.log('Deployed to:', deploying.target);
}
  
main()
.then(() => process.exit(0))
.catch((error) => {
    console.error(error);
    process.exit(1);
});