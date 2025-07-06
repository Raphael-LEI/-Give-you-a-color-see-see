// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ColorSeeSeeNFT is ERC721URIStorage, Ownable {
    uint256 public nextTokenId;

    event Minted(address indexed to, uint256 indexed tokenId, string tokenURI);

    constructor() ERC721("ColorSeeSeeNFT", "CSSNFT") {}

    /**
     * @dev 用户自助铸造NFT，tokenURI为IPFS元数据链接
     * @param to NFT接收者地址
     * @param tokenURI NFT元数据的IPFS链接
     */
    function mint(address to, string memory tokenURI) public returns (uint256) {
        uint256 tokenId = nextTokenId;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
        nextTokenId++;
        emit Minted(to, tokenId, tokenURI);
        return tokenId;
    }
}