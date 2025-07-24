 // SPDX-License-Identifier: MIT
 pragma solidity ^0.8.23;
 import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

 contract YAFMToken is ERC20 {
     uint256 public constant MAX_SUPPLY = 1_000_000_000 * 1e18;
     constructor(address distribution) ERC20("YAFM Token", "YAFM") {
         _mint(distribution, MAX_SUPPLY);
     }
 }
