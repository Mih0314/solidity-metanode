// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract BeggingContract {

    mapping(address => uint256) private donators;

    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner () {
        require(owner == msg.sender,"Not owner");
        _;
    }

    function donate() external payable {
        require(msg.value > 0, "Donation amount must be greater than 0");
        donators[msg.sender] += msg.value;
    }

    function withdraw (uint256 amount) external onlyOwner {
        require(address(this).balance >= amount,"contract balance not enough");
        payable(owner).transfer(amount);
    }

    function getDonation (address donator) external view returns (uint256) {
        return donators[donator];
    }
}