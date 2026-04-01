// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenRegistry {
    // 1. Define a struct to represent a token
    struct Token {
        string name;
        string symbol;
        address owner;
        bool isActive;
    }

    // 2. Use a mapping to store tokens by a unique ID
    mapping(uint256 => Token) public tokens;
    
    // 3. Use an array to track all registered token IDs
    uint256[] public tokenIds;
    
    // Counter for auto-incrementing the token ID
    uint256 private nextTokenId = 1;

    // Bonus: Event that fires whenever a new token is registered
    event TokenRegistered(uint256 indexed id, string name, string symbol, address indexed owner);

    // 4. Implement functions

    // Registers a new token, assigns an auto-incremented ID, sets isActive = true
    function registerToken(string memory _name, string memory _symbol) public {
        // Bonus: Check that prevents registering a token with an empty name or symbol
        require(bytes(_name).length > 0, "Token name cannot be empty");
        require(bytes(_symbol).length > 0, "Token symbol cannot be empty");

        uint256 currentId = nextTokenId;
        
        tokens[currentId] = Token({
            name: _name,
            symbol: _symbol,
            owner: msg.sender,
            isActive: true
        });

        tokenIds.push(currentId);
        nextTokenId++;

        // Emit the registration event
        emit TokenRegistered(currentId, _name, _symbol, msg.sender);
    }

    // Sets a token's isActive to false (only the owner can do this)
    function deactivateToken(uint256 _id) public {
        require(tokens[_id].owner == msg.sender, "Only the token owner can deactivate it");
        require(tokens[_id].isActive == true, "Token is already inactive");
        
        tokens[_id].isActive = false;
    }

    // Returns all info about a token
    function getToken(uint256 _id) public view returns (string memory name, string memory symbol, address owner, bool isActive) {
        Token memory t = tokens[_id];
        return (t.name, t.symbol, t.owner, t.isActive);
    }

    // Returns the full array of registered IDs
    function getAllTokenIds() public view returns (uint256[] memory) {
        return tokenIds;
    }
}