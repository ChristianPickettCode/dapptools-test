// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "../lib/ds-test/src/test.sol";

abstract contract Hevm {
  // sets the block timestamp to x
  function warp(uint256 x) public virtual;

  // sets the block number to x
  function roll(uint256 x) public virtual;

  // sets the slot loc of contract c to val
  function store(
    address c,
    bytes32 loc,
    bytes32 val
  ) public virtual;

  // reads the slot loc of contract c
  //   function store(
  //     address c,
  //     bytes32 loc,
  //     bytes32 val
  //   ) public virtual;
}

contract TimeTravel is DSTest {
  Hevm hevm;

  function setUp() public {
    // Cheat address
    // https://github.com/dapphub/dapptools/pull/71
    hevm = Hevm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);
  }

  function test_basic_sanity() public {
    uint256 lastTime = block.timestamp;
    bool isWarped = block.timestamp > lastTime;
    assertTrue(!isWarped);
  }

  function test_can_time_travel() public {
    uint256 lastTime = block.timestamp;

    hevm.warp(lastTime + 500);

    bool isWarped = block.timestamp > lastTime;

    assertTrue(isWarped);
  }
}
