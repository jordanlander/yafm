 // SPDX-License-Identifier: MIT
 pragma solidity ^0.8.23;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @title YAFMToken
/// @notice ERC20 token with a fixed supply minted at deployment.
/// @dev Entire `MAX_SUPPLY` is minted to the `distribution` address in the constructor.
contract YAFMToken is ERC20 {
    /// @notice Total number of tokens that will ever exist.
    uint256 public constant MAX_SUPPLY = 1_000_000_000 * 1e18;

    /// @param distribution Address that receives the full token supply.
    constructor(address distribution) ERC20("YAFM Token", "YAFM") {
        _mint(distribution, MAX_SUPPLY);
    }
}
