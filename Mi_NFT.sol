// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";

contract  Mi_NFT  is ERC721{
    
    using Counters for Counters.Counter;
    
    Counters.Counter private _tokenIds;
    
    
    // Optional mapping for token URIs
    mapping(uint256 => string) private _tokenURIs;
    
    
    
    constructor() ERC721 ("DEVELOP LAB", "DLAB") {}
    
    function mainNFT(address receiver, string memory tokenURI) public returns(uint256) {
        _tokenIds.increment();
        uint256 newTokenId = _tokenIds.current();
        
        _safeMint(receiver, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        return newTokenId;
    }
    
    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        require(_exists(tokenId), "ERC721URIStorage: URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
    }
}
