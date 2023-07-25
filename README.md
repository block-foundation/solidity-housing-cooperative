<div align="right">

  [![license](https://img.shields.io/github/license/block-foundation/solidity-houding-cooperative?color=green&label=license&style=flat-square)](LICENSE.md)
  ![stars](https://img.shields.io/github/stars/block-foundation/solidity-houding-cooperative?color=blue&label=stars&style=flat-square)
  ![contributors](https://img.shields.io/github/contributors/block-foundation/solidity-houding-cooperative?color=blue&label=contributors&style=flat-square)

</div>

---

<div>
    <img align="right" src="https://raw.githubusercontent.com/block-foundation/brand/master/src/logo/logo_gray.png" width="96" alt="Block Foundation Logo">
    <h1 align="left">Blockchain Housing Cooperative Management</h1>
    <h3 align="left">Block Foundation Smart Contract Series [Solidity]</h3>
</div>

---

<div>
<img align="right" width="75%" src="https://raw.githubusercontent.com/block-foundation/brand/master/src/image/repository_cover/block_foundation-structure-03-accent.jpg"  alt="Block Foundation">
<br>
<details open="open">
<summary>Table of Contents</summary>
  
- [Introduction](#style-guide)
- [Quick Start](#quick-start)
- [Contract](#contract)
- [Development Resources](#development-resources)
- [Legal Information](#legal-information)
  - [Copyright](#copyright)
  - [License](#license)
  - [Warning](#warning)
  - [Disclaimer](#disclaimer)

</details>
</div>

<br clear="both"/>

## Introduction

Welcome to Blockchain Housing Cooperative Management! This project aims to leverage blockchain technology to provide an efficient, transparent, and secure platform for managing housing cooperatives.

Traditionally, housing cooperatives have faced challenges in areas such as record keeping, transparency, property ownership transfer, and fund management. Our project addresses these challenges by harnessing the power of blockchain technology. We are creating a decentralized application (DApp) that will maintain a record of all houses owned by the cooperative, track the owners of each house, and handle transactions related to these properties, all in a secure and transparent manner.

This platform will use smart contracts - self-executing contracts with the terms of the agreement directly written into code. For our project, we'll be using Solidity for Ethereum blockchain and PyTeal for Algorand blockchain. These smart contracts will handle tasks such as adding new houses to the cooperative, changing ownership, and managing funds for house purchases.

Our project will offer benefits like improved transparency, as every transaction will be recorded on the blockchain and can be audited. It will also increase efficiency, as transactions and changes of ownership can be handled within the blockchain without the need for a middleman. Lastly, it ensures higher security and trust as the blockchain ledger is immutable and every transaction can be traced and verified.

The end goal of this project is to revolutionize how housing cooperatives are managed, by bringing them into the digital age and making them more secure, efficient, and transparent. Whether you are part of a housing cooperative, interested in the potential of blockchain technology, or just curious to see how decentralized applications can be used in new and exciting ways, we invite you to join us on this journey of innovation.

Welcome aboard! Let's build the future of housing cooperatives together.

## Quick Start

> Install

``` sh
npm i
```

> Compile

``` sh
npm run compile
```

## Contract

The contract will keep track of the houses owned by the cooperative, and it will allow new houses to be added to the cooperative's list of properties. For simplicity, each house will be represented by an address (to mimic a unique identifier), and it will be recorded along with the owner's name.

- This contract adds houses to an array and allows the owner of a house to change the owner name. There's also an event that will be emitted when a new house is added.
- This contract assumes that each house has a unique Ethereum address, which is used as an identifier. It also assumes that the person executing the contract (msg.sender) is the house owner. This contract might not cover your actual needs, and it's advised to get in touch with a Solidity developer who can help create a more complex contract that covers all your needs.
- Each house has a price and can be put up for sale. Members can buy a house if it is for sale and if they send enough Ether. The Ether is then added to the previous owner's balance. Members can withdraw their funds at any time.
- This contract assumes  that the price of each house is 1 Ether and that transactions only happen between members of the cooperative.
- This contract assumes that the price of each house is static and set when the house is added. In a real contract, you might want to allow the price to change over time or have some mechanism to determine the price dynamically.

*Please be aware that smart contracts handling real-world assets can have legal implications and may require a legal framework beyond the smart contract itself to be enforceable and effective.*

## Development Resources

### Other Repositories

#### Block Foundation Smart Contract Series

|                                   | `Solidity`  | `Teal`      |
| --------------------------------- | ----------- | ----------- |
| **Template**                      | [**>>>**](https://github.com/block-foundation/solidity-template) | [**>>>**](https://github.com/block-foundation/teal-template) |
| **Architectural Design**          | [**>>>**](https://github.com/block-foundation/solidity-architectural-design) | [**>>>**](https://github.com/block-foundation/teal-architectural-design) |
| **Architecture Competition**      | [**>>>**](https://github.com/block-foundation/solidity-architecture-competition) | [**>>>**](https://github.com/block-foundation/teal-architecture-competition) |
| **Housing Cooporative**           | [**>>>**](https://github.com/block-foundation/solidity-housing-cooperative) | [**>>>**](https://github.com/block-foundation/teal-housing-cooperative) |
| **Land Registry**                 | [**>>>**](https://github.com/block-foundation/solidity-land-registry) | [**>>>**](https://github.com/block-foundation/teal-land-registry) |
| **Real-Estate Crowdfunding**      | [**>>>**](https://github.com/block-foundation/solidity-real-estate-crowdfunding) | [**>>>**](https://github.com/block-foundation/teal-real-estate-crowdfunding) |
| **Rent-to-Own**                   | [**>>>**](https://github.com/block-foundation/solidity-rent-to-own) | [**>>>**](https://github.com/block-foundation/teal-rent-to-own) |
| **Self-Owning Building**          | [**>>>**](https://github.com/block-foundation/solidity-self-owning-building) | [**>>>**](https://github.com/block-foundation/teal-self-owning-building) |
| **Smart Home**                    | [**>>>**](https://github.com/block-foundation/solidity-smart-home) | [**>>>**](https://github.com/block-foundation/teal-smart-home) |

## Legal Information

### Copyright

Copyright &copy; 2023 [Block Foundation](https://www.blockfoundation.io/ "Block Foundation website"). All Rights Reserved.

### License

Except as otherwise noted, the content in this repository is licensed under the
[Creative Commons Attribution 4.0 International (CC BY 4.0) License](https://creativecommons.org/licenses/by/4.0/), and
code samples are licensed under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0).

Also see [LICENSE](https://github.com/block-foundation/community/blob/master/LICENSE) and [LICENSE-CODE](https://github.com/block-foundation/community/blob/master/LICENSE-CODE).

### Warning

**Please note that this code should be audited by a professional smart-contract auditor before being used in a production environment as it is a simplified example and may not cover all potential security vulnerabilities.**

### Disclaimer

**THIS SOFTWARE IS PROVIDED AS IS WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY IMPLIED WARRANTIES OF FITNESS FOR A PARTICULAR PURPOSE, MERCHANTABILITY, OR NON-INFRINGEMENT.**
