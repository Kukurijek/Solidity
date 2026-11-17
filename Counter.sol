// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Example {

    // This is the owner of the contract
    address owner;

    // This is our counter struct. It will hold necessary information about the counter which are
    // number and description
    struct Counter {
        uint number;
        string description;
    }

    // Here we create an instance of our Counter.
    // It is empty for now, but we will initialize it in the constructor.
    Counter counter;

    // We will use this modidifer with our execute functions.
    // This modifiers make sure that the caller of the function is the owner of the contract.
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can increment or decrement the counter");
        _;
    }

    // This is our constructor function. It only runs once when we deploy the contract.
    // Since it takes two parameters, initial_value and description, they should be provided
    // when we deploy our contract.
    constructor(uint initial_value, string memory description) {
        owner = msg.sender;
        counter = Counter(initial_value, description);
    }

    // This function gets the number field from the counter struct and increases it by one.
    function increment_counter() external onlyOwner {
        counter.number += 1;
    }

    // This function is similar the one above, but instead of increasing we deacrease the number by one.
    function decrement_counter() external onlyOwner {
        counter.number -= 1;
    }

    // This function returns the number field of our counter struct.
    // Returning the current state of our counter.
    function get_counter_value() external view returns(uint) {
        return counter.number;
    }

    // Task 1: This function returns the description field of our counter struct.
    // It is a query function (view), so it does not cost any gas.
    function get_counter_description() external view returns(string memory) {
        return counter.description;
    }
}
