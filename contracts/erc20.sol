// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./IERC20.sol";

contract ERC20 is IERC20 {
    uint public override totalSupply = 1000;
    mapping(address => uint) public override balanceOf;
    mapping(address => mapping(address => uint)) public override allowance;
    string public name = "TestToken";
    string public symbol = "TEST";
    uint8 public decimals = 18;

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address recipient, uint amount)
        external
        override
        returns (bool)
    {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender,recipient,amount);
        return true;
    }

    function approve(address spender, uint amount)
        external
        override
        returns (bool)
    {
        // require(allowance[msg.sender][spender] >= amount,"You cannot spend more than the allowed amount!");
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external override returns (bool) {
        
        return true;
    }

    function mint(uint amount) external {
        // code
    }

    function burn(uint amount) external {
        // code
    }
}
