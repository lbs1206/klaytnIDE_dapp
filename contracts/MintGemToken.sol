// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract MintGemToken is ERC721Enumerable {

    constructor(string memory _name, string memory _symbol) ERC721(_name,_symbol){}

    function MintGemToken() public {
       uint tokenId = totalSupply() + 1;

        _mint(msg.sender, tokenId);
    }
}
