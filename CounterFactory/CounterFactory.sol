// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "./Counter.sol";

contract CounterFactory {
    mapping(address => Counter) _counters;

    function createCounter() public {
        require(_counters[msg.sender] == Counter(address(0)));
        _counters[msg.sender] = new Counter(msg.sender);
    }

    function increment() public {
        require(
            _counters[msg.sender] != Counter(address(0)),
            "first you need to create a counter"
        );
        Counter(_counters[msg.sender]).increment(msg.sender);
    }

    function getCount(address account) public view returns (uint256) {
        require(
            _counters[account] != Counter(address(0)),
            "no counter for this address"
        );
        return _counters[account].getCount();
    }

    function getMyCount() public view returns (uint256) {
        return getCount(msg.sender);
    }
}
