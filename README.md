# 🪙 Token Registry Smart Contract 

This project showcases the **TokenRegistry** smart contract—a decentralized system for registering and managing custom tokens.

It highlights key Solidity concepts like **structs, mappings, arrays, events, and access control** in a clean and practical way. 💻

---

## ✨ Project Overview

The `TokenRegistry` contract allows users to:

* Create their own tokens 🆕
* Store token data on-chain ⛓️
* Manage token activity status 🔄
* Retrieve token information easily 🔍

Each token is assigned a **unique auto-incremented ID**, making it easy to track and manage.

---

## 🏗️ Contract Architecture

### 📦 Data Structures

#### 🔹 `Token` Struct

Defines the structure of each token:

* 📝 **name** → Token name (e.g., "Bitcoin")
* 🔣 **symbol** → Token symbol (e.g., "BTC")
* 👤 **owner** → Creator's address
* 🟢 **isActive** → Token status (true/false)

---

### 🗄️ State Variables

* 🧾 `mapping(uint256 => Token) tokens`
  → Stores tokens using unique IDs

* 📚 `uint256[] tokenIds`
  → Keeps track of all registered token IDs

* 🔢 `uint256 nextTokenId`
  → Auto-increment counter for new tokens

---

## 🛠️ Functions Breakdown

| Function                         | Description                                       | Access        |
| :------------------------------- | :------------------------------------------------ | :------------ |
| 🆕 `registerToken(name, symbol)` | Creates a new token, assigns ID, and activates it | Public        |
| 🛑 `deactivateToken(id)`         | Deactivates a token                               | 🔒 Owner Only |
| 🔍 `getToken(id)`                | Returns token details                             | Public (View) |
| 📜 `getAllTokenIds()`            | Returns all token IDs                             | Public (View) |

---

## 🔎 Function Details

### 🆕 registerToken(name, symbol)

* Validates input (no empty values)
* Assigns unique ID
* Stores token in mapping
* Adds ID to array
* Emits event 📢

---

### 🛑 deactivateToken(id)

* Only token owner can call 🔒
* Ensures token is active
* Sets `isActive = false`

---

### 🔍 getToken(id)

Returns:

* name 📝
* symbol 🔣
* owner 👤
* isActive 🟢

---

### 📜 getAllTokenIds()

Returns all registered token IDs:

```
[1, 2, 3]
```

---

## 💎 Bonus Features Implemented 🏆

### 📢 Event Logging

```
event TokenRegistered(uint256 indexed id, string name, string symbol, address indexed owner);
```

✔ Fires whenever a token is created
✔ Useful for frontend apps (DApps)

---

### 🛡️ Input Validation

```
require(bytes(name).length > 0);
require(bytes(symbol).length > 0);
```

✔ Prevents empty token name/symbol
✔ Ensures data integrity

---

## 🧪 How to Test (Step-by-Step)

1. Open Remix IDE 🌐
2. Create `TokenRegistry.sol`
3. Paste contract code
4. Compile with Solidity `^0.8.0`
5. Deploy using Remix VM

### ▶️ Test Actions

* Register token:

```
registerToken("MyToken", "MTK")
```

* Get token:

```
getToken(1)
```

* Get all IDs:

```
getAllTokenIds()
```

* Deactivate:

```
deactivateToken(1)
```

---

## 🔐 Security Considerations

* 🔒 Owner-only deactivation
* 🚫 Prevents empty inputs
* ✅ Maintains valid token state

---

## 🛠️ Tech Stack

* Solidity ^0.8.0
* Remix IDE

---




