// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import= "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import= "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721, Ownable {
    uint256 public constant MAX_SUPPLY = 10000;
    uint256 public nextTokenId = 0;

    constructor() ERC721("MyNFT", "MNFT") {}

//When a user wants to mint an NFT, they will provide 
//their address along with a proof that their address 
// is in the Merkle tree. The smart contract will then
// verify the proof and check if the user's address is
// in the tree.
    function mint() public onlyOwner {
        require(nextTokenId < MAX_SUPPLY, "Maximum supply reached");
        _safeMint(msg.sender, nextTokenId);
        nextTokenId++;
    }
}
