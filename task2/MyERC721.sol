// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// 导入 OpenZeppelin 的 ERC721 库（提供标准实现）
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// 导入 ERC721URIStorage（用于存储 tokenURI 元数据链接）
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

// 继承 ERC721 和 ERC721URIStorage（后者扩展了元数据功能）
contract MyTestNFT is ERC721URIStorage {
    uint256 private _tokenIdCounter; // 用于生成唯一 tokenId

    // 构造函数：初始化 NFT 名称和符号
    constructor() ERC721("MyTestNFT", "MTN") {
        _tokenIdCounter = 1; // tokenId 从 1 开始（避免 0 地址冲突）
    }

    // 铸造 NFT 函数：接收接收者地址和元数据链接
    function mintNFT(address recipient, string memory tokenURI) external {
        uint256 currentTokenId = _tokenIdCounter;
        _tokenIdCounter++; // 每次铸造后自增，确保 tokenId 唯一

        // 安全铸造 NFT 到接收者地址
        _safeMint(recipient, currentTokenId);
        // 将元数据链接与当前 tokenId 绑定
        _setTokenURI(currentTokenId, tokenURI);
    }
}