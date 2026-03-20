// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./ComplianceRegistry.sol";

contract PropertyToken is ERC20, Ownable {
    ComplianceRegistry public registry;
    string public propertyPhysicalAddress;
    string public legalDocumentHash;

    constructor(
        string memory name,
        string memory symbol,
        uint256 totalShares,
        address _registry,
        string memory _physicalAddr,
        string memory _docHash
    ) ERC20(name, symbol) Ownable(msg.sender) {
        registry = ComplianceRegistry(_registry);
        propertyPhysicalAddress = _physicalAddr;
        legalDocumentHash = _docHash;
        _mint(msg.sender, totalShares * 10 ** decimals());
    }

    /**
     * @dev Hook that ensures both sender and receiver are KYC verified.
     */
    function _update(address from, address to, uint256 value) internal override {
        if (from != address(0) && to != address(0)) {
            require(registry.isVerified(from), "Sender not KYC verified");
            require(registry.isVerified(to), "Receiver not KYC verified");
        }
        super._update(from, to, value);
    }

    function distributeRent(address token, uint256 amount) external onlyOwner {
        // Logic for pulling stablecoins and updating snapshot-based rewards
    }
}
