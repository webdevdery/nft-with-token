// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.8.0;

contract Marketplace {

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
}