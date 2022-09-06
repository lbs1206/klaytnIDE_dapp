// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/Ownalbe.sol";
//import "@klaytn/contracts/token/KIP17/KIP17Full.sol";
//import "@klaytn/contracts/ownership/Ownable.sol";

contract MintGemToken is ERC721Enumerable , Ownable{
    uint constant public MAX_TOKEN_COUNT = 20;

    string public metadataURI;

    //10^18 Peb = 1 Klay;
    uint public minchoTokenPrice = 1000000000000000000;

    constructor(string memory _name, string memory _symbol,string memory _metadataURI) ERC721(_name,_symbol){
        metadataURI = _metadataURI;
    }

    function tokenURI(uint256 _tokenId) override public view returns (string memory)  {
        string memory str_id = Strings.toString(_tokenId);

        return string(abi.encodePacked(metadataURI,'/',str_id,'.json'));
    }

    function mintGemToken() public payable {
        require(minchoTokenPrice <=  msg.value,'Not enough Klay.');
        require(MAX_TOKEN_COUNT > totalSupply(),'No more minting is possible');

        uint tokenId = totalSupply() + 1;

        payable(owner()).transfer(msg.value);

        _mint(msg.sender, tokenId);
    }
}
