// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HackathonHungary2023PoP is ERC721, ReentrancyGuard, Ownable {
    uint256 private _tokenId;

    constructor(address _owner) ERC721("PolkadotHackathonHungary2023PoP", "PHH23P") Ownable(_owner) {}

    uint256 public constant MAX_SUPPLY_PER_ADDRESS = 1;

    uint16 public constant TIER_ORGANISER = 1;
    uint16 public constant TIER_PLAYER = 2;

    string public baseTokenURI = "";

    mapping(address => bool) private _hasNFT;
    mapping(uint256 => uint16) public tokenTiers;

    function mint(address to, uint16 tierId) external onlyOwner returns(uint256) {
        require(!_hasNFT[to], "Address already has an NFT");
        require(tierId == TIER_ORGANISER || tierId == TIER_PLAYER, "Invalid token tier");
        
        _tokenId++;
        _safeMint(to, MAX_SUPPLY_PER_ADDRESS);
        _hasNFT[to] = true;
        tokenTiers[_tokenId] = tierId;

        return _tokenId;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseTokenURI;
    }

    function setBaseTokenURI(string memory _baseTokenURI) public onlyOwner {
        baseTokenURI = _baseTokenURI;
    }

    /**
     * @dev Returns the URI for a given token tier. Has a default option.
     */
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        
        if (tokenTiers[tokenId] == TIER_ORGANISER) {
            return string(abi.encodePacked(baseTokenURI, "organiser.json"));
        } else if (tokenTiers[tokenId] == TIER_PLAYER) {
            return string(abi.encodePacked(baseTokenURI, "player.json"));
        } else {
            return string(abi.encodePacked(baseTokenURI, "default.json"));
        }

    }

    function hasNFT(address account) external view returns (bool) {
        return _hasNFT[account];
    }

    /**
     * @dev See {IERC721-safeTransferFrom}. 
     * We override this function to prevent the transfer of the NFT as it is a PoP NFT.
     */
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public virtual override {
        require(false, "Cannot transfer soulbound NFT");
        super.safeTransferFrom(from, to, tokenId, _data);
    }

    function transferOwnership(address newOwner) public override onlyOwner {
        super.transferOwnership(newOwner);
    }

    function withdraw(address to) external nonReentrant onlyOwner {
        payable(to).transfer(address(this).balance);
    }
}