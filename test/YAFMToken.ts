
import { expect } from 'chai';
import { ethers } from 'hardhat';


describe('YAFMToken', () => {
  it('mints total supply to distribution address', async () => {
    const [dist] = await ethers.getSigners();
    const Token = await ethers.getContractFactory('YAFMToken');
    const token = await Token.deploy(dist.address);
    const total = await token.totalSupply();
    expect(await token.balanceOf(dist.address)).to.equal(total);
  });
});
