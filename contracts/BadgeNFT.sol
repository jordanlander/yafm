 // SPDX-License-Identifier: MIT
 pragma solidity ^0.8.23;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

/// @title BadgeNFT
/// @notice Non-transferable ERC721 used to award course badges.
/// @dev Only the `issuer` address may mint new tokens.
contract BadgeNFT is ERC721 {
    using Strings for uint256;

    /// @notice Error thrown when a transfer is attempted.
    error NonTransferable();

    /// @notice Address allowed to mint new badges.
    address public issuer;

    /// @notice Token ID that will be assigned to the next minted badge.
    uint256 public nextId;

    /// @notice Lesson identifier for each badge.
    mapping(uint256 => uint16) public lessonOf;

    /// @notice Base URI used to build `tokenURI` responses.
    string public baseURI;

    /// @param _issuer Address authorized to mint badges.
    /// @param _base Base URI for token metadata.
    constructor(address _issuer, string memory _base) ERC721("YAFM Badge", "YBADGE") {
        issuer = _issuer;
        baseURI = _base;
    }

    /// @notice Mint a badge for a lesson and assign it to `to`.
    /// @param to Recipient of the newly minted badge.
    /// @param lessonId Identifier of the completed lesson.
    /// @return id Newly minted token ID.
    function mint(address to, uint16 lessonId) external returns (uint256 id) {
        require(msg.sender == issuer, "NOT_ISSUER");
        id = ++nextId;
        _safeMint(to, id);
        lessonOf[id] = lessonId;
    }

    /// @dev Prevent tokens from being transferred once minted.
    function _update(address to, uint256 tokenId, address auth)
        internal
        override
        returns (address from)
    {
        from = _ownerOf(tokenId);
        if (from != address(0) && to != address(0)) revert NonTransferable();
        return super._update(to, tokenId, auth);
    }

    /// @notice Return the metadata URI for `tokenId`.
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return string(abi.encodePacked(baseURI, tokenId.toString(), ".json"));
    }
}

