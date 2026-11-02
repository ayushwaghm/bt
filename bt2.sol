// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Bank {
    uint public balance;

    function deposit() public payable {
        balance += msg.value;
    }

function withdraw(uint amount) public {
    require(amount > 0, "Amount must be greater than zero");
    require(amount <= balance, "Insufficient balance");

    balance -= amount;

    (bool success, ) = payable(msg.sender).call{value: amount}("");

    require(success, "Transfer failed");
}

    function showBalance() public view returns (uint) {
        return balance;
    }
}
