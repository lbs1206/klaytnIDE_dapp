// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/Ownalbe.sol";

contract MintGemToken is ERC721Enumerable , Ownable{
    string public metadataURI;

    constructor(string memory _name, string memory _symbol,string memory _metadataURI) ERC721(_name,_symbol){
        metadataURI = _metadataURI;
    }

    function tokenURI(uint256 _tokenId) override public view returns (string memory)  {
        string memory str_id = Strings.toString(_tokenId);

        return string(abi.encodePacked(metadataURI,'/',str_id,'.json'));
    }

    function mintGemToken() public {
       uint tokenId = totalSupply() + 1;

        _mint(msg.sender, tokenId);
    }


}
