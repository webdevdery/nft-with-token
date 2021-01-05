// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20Metadata is ERC20, Ownable {
    using SafeMath for uint256;

    // String uri holding the metadata for the token.
    string private _uri;

    event TokenURIUpdated(string indexed tokenURI);

    constructor(string memory uri) {
        _uri = uri;
    }

    /**
     * @dev Update the token metadata URI.
     * @return string
     */
    function tokenURI() external view returns (string) {
        return _uri;
    }

    /**
     * @dev Update the token metadata URI.
     * @param uri string new uri.
     */
    function updateTokenURI(string memory uri) public onlyOwner {
        emit TokenURIUpdated(uri);
        _uri = uri;
    }

}
