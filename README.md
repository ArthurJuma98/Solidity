# Postgram Smart Contract

Postgram is a Solidity smart contract that allows users to create, like, and unlike posts similar to social media platforms like Twitter.

## Overview

Postgram provides functionalities to create, like, and unlike posts within the Ethereum blockchain. Each post is associated with an author, content, timestamp, and number of likes.

## Features

- **Create Post**: Users can create a post with a maximum length defined by the contract owner.
- **Like Post**: Users can like a post, increasing its like count.
- **Unlike Post**: Users can unlike a post, decreasing its like count.
- **Get Post**: Retrieve a specific post by its owner and index.
- **Get All Posts**: Retrieve all posts by a specific owner.

## Usage

### Prerequisites

- Make sure you have an Ethereum wallet such as MetaMask configured with a compatible Ethereum network.

### Interacting with the Contract

1. Deploy the `Postgram` contract to an Ethereum network.
2. Use a tool like Remix IDE or Truffle to interact with the deployed contract.
3. Connect your Ethereum wallet to the dApp.
4. Interact with the contract functions:
   - `createPost`: Create a new post with a specified content.
   - `likePost`: Like a post by providing the author's address and post ID.
   - `unlikePost`: Unlike a post by providing the author's address and post ID.
   - `getPost`: Retrieve a specific post by providing the owner's address and index.
   - `getAllPosts`: Retrieve all posts by providing the owner's address.

### Contract Owner

- The contract owner has the privilege to change the maximum post length allowed.
- Only the contract owner can change the maximum post length.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

