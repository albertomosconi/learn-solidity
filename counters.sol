// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

abstract contract Counter {
    event ValueChanged(uint256 oldValue, uint256 newValue);

    uint256 private count = 0;

    constructor(uint256 startValue) {
        count = startValue;
    }

    function setCounter(uint256 newValue) internal {
        emit ValueChanged(count, newValue);
        count = newValue;
    }

    function getCount() public view returns (uint256) {
        return count;
    }

    function step() public virtual;
}

contract IncrementByOneCounter is Counter {
    constructor(uint256 startValue) Counter(startValue) {}

    function step() public override {
        setCounter(getCount() + 1);
    }
}

contract IncrementByStep is Counter {
    uint256 private stepSize;

    constructor(uint256 startValue, uint256 stepValue) Counter(startValue) {
        stepSize = stepValue;
    }

    function step() public override {
        setCounter(getCount() + stepSize);
    }
}
