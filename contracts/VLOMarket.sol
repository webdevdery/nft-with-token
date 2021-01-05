// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.8.0;

import "@openzeppelin/contracts/math/SafeMath.sol";
import "./ERC721Market.sol";

contract VLOMarket is ERC721Market, Ownable {
    using SafeMath for uint256;



    enum ListingType { Auction, DirectBuy }

    struct Listing{
        uint id;
        uint collectibleId;
        string name;
        uint ethPrice;
        ListingType listingType;
    }

    struct Artist{
        uint id;
        string name;
    }

    struct Collectible{
        uint id;
        uint artistId;
        string name;
        uint ethPrice;
    }

    mapping(uint => Listing) public listings;
    uint public listingsCount;

    function addListing (uint collectibleId, string memory _name, uint _ethPrice, Marketplace.ListingType listingType)
    private{
        listingsCount++;
        listings[listingsCount] = Listing(listingsCount, collectibleId, _name, _ethPrice, listingType);
    }

    function createAuctionListing(uint collectibleId, string memory _name, uint _ethPrice)
    private{
        addListing(collectibleId, _name, _ethPrice, Marketplace.ListingType.Auction);
    }
}