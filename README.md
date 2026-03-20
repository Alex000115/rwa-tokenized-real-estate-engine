# RWA Tokenized Real Estate Engine 🏠

A professional-grade repository for bringing off-chain assets onto the blockchain. This engine allows for the fractionalization of high-value assets (like real estate) into compliant, liquid ERC-20 tokens.

## Core Features
- **Asset Fractionalization**: Split a property into millions of tradable tokens.
- **Compliance Layer**: Integrated identity (KYC/AML) verification requirements for transfers.
- **Rental Distribution**: Logic to push stablecoin rewards to token holders based on their ownership percentage.
- **Administrative Control**: Secure functions for document hashing and legal tie-ins.

## Workflow
1. **Onboarding**: Property data and legal documents are hashed and stored on-chain.
2. **Minting**: `PropertyToken` is minted representing the total value.
3. **Whitelist**: Only verified addresses are added to the `ComplianceRegistry`.
4. **Distribution**: Rental income is sent to the contract and claimed by shareholders.

## Tech Stack
- Solidity ^0.8.20
- OpenZeppelin (ERC20, AccessControl)
- Hardhat / Foundry
