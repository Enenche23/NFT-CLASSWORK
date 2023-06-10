// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import = "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import ="@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is Ownable {
    bytes32 public merkleRoot;

    constructor(bytes32 _merkleRoot) {
        merkleRoot = _merkleRoot;
    }

    function claim(bytes32[] calldata proof) external {
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender));
        require(MerkleProof.verify(proof, merkleRoot, leaf), "Invalid proof");
        // mint NFT to msg.sender
    }
}
