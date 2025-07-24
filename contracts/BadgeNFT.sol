 // SPDX-License-Identifier: MIT
 pragma solidity ^0.8.23;
 import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
 import "@openzeppelin/contracts/utils/Strings.sol";

 contract BadgeNFT is ERC721 {
     using Strings for uint256;
     error NonTransferable();
     address public issuer;
     uint256 public nextId;
     mapping(uint256 => uint16) public lessonOf;
     string public baseURI;

     constructor(address _issuer, string memory _base) ERC721("YAFM Badge", "YBADGE") {
         issuer = _issuer;
         baseURI = _base;
     }

     function mint(address to, uint16 lessonId) external returns (uint256 id) {
         require(msg.sender == issuer, "NOT_ISSUER");
         id = ++nextId;
         _safeMint(to, id);
         lessonOf[id] = lessonId;
     }

     function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
         internal
         override
     {
         if (from != address(0) && to != address(0)) revert NonTransferable();
         super._beforeTokenTransfer(from, to, tokenId, batchSize);
     }

     function tokenURI(uint256 tokenId) public view override returns (string memory) {
         return string(abi.encodePacked(baseURI, tokenId.toString(), ".json"));
     }
 }
