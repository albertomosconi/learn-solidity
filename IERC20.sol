// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// The minimal interface for an ERC-20 token
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
interface IERC20 {
    // MUST trigger when tokens are transferred, including zero value transfers.
    // A token contract which creates new tokens SHOULD trigger a Transfer event
    // with the _from address set to 0x0 when tokens are created.
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    // MUST trigger on any successful call to approve(...)
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    // returns the total supply of the token
    function totalSupply() external view returns (uint256);

    // returns the balance of the account with address _owner
    function balanceOf(address _owner) external view returns (uint256 balance);

    // Transfers _value amount of tokens to address _to.
    // It MUST fire the Transfer event.
    // The function SHOULD throw if the message caller’s
    // account balance does not have enough tokens to spend.
    // Transfers of 0 values MUST be treated as normal transfers
    // and fire the Transfer event.
    function transfer(address _to, uint256 _value)
        external
        returns (bool success);

    // Transfers _value amount of tokens from address _from to address _to.
    // It MUST fire the Transfer event.
    // Can be used for example to allow a contract to transfer tokens for you
    // and/or to charge fees in sub-currencies.
    // The function SHOULD throw unless the _from account has
    // deliberately authorized the sender of the message via some mechanism.
    // Transfers of 0 values MUST be treated as normal transfers
    // and fire the Transfer event.
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) external returns (bool success);

    // Allows _spender to withdraw from your account multiple times,
    // up to the _value amount. If called again it overwrites the current
    // allowance with the new _value.
    // ! read official spec for warning on vulnerabilities.
    function approve(address _spender, uint256 _value)
        external
        returns (bool success);

    // Returns the amout which _spender is allowed to withdraw from _owner.
    function allowance(address _owner, address _spender)
        external
        view
        returns (uint256 remaining);
}
