// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract ComplianceRegistry is AccessControl {
    bytes32 public constant VERIFIER_ROLE = keccak256("VERIFIER_ROLE");
    mapping(address => bool) private _isVerified;

    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function verifyAddress(address account) external onlyRole(VERIFIER_ROLE) {
        _isVerified[account] = true;
    }

    function revokeAddress(address account) external onlyRole(VERIFIER_ROLE) {
        _isVerified[account] = false;
    }

    function isVerified(address account) public view returns (bool) {
        return _isVerified[account];
    }
}
