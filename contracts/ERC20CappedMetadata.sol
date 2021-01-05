// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";
import "./ERC20Metadata.sol";

contract ERC20CappedMetadata is ERC20Capped, ERC20Detailed, ERC20Metadata {
    using SafeMath for uint256;

    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        string memory uri,
        uint256 cap
    )
        ERC20Capped(cap)
        ERC20Detailed(name, symbol, decimals)
        ERC20Metadata(uri)
    {}
}