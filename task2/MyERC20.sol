// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract MyERC20 is IERC20 {

    mapping(address => mapping(address => uint256)) private _allowances;

    mapping(address => uint256) private _balances;

    uint256 private _totalSupply;

    address private _owner;

    constructor() {
        _owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == _owner, "Not owner");
        _;
    }

    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }
    function balanceOf(address account) external view returns (uint256) {
        return _balances[account];
    }
    function transfer(address to, uint256 amount) external returns (bool){
        require(_balances[msg.sender] > amount,"amount not enough");
        _balances[msg.sender] -= amount;
        _balances[to] += amount;

        emit Transfer(msg.sender,to, amount);
        return true;
    }
    function allowance(address owner, address spender) external view returns (uint256){
        return _allowances[owner][spender];
    }
    function approve(address spender, uint256 amount) external returns (bool){
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender,spender,amount);
        return true;
    }
    function transferFrom(address from, address to, uint256 amount) external returns (bool){
        require(from.balance > amount,"from amount not enough");
        require(_allowances[from][msg.sender] > amount,"from allow amount not enough");
        _allowances[from][msg.sender] -= amount; 

        _balances[from] -= amount;
        _balances[to] += amount;

        return true;
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _totalSupply += amount;
        _balances[to] += amount;
        emit Transfer(address(0), to, amount); 
    }
}
