// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "../lib/ds-test/src/test.sol";

import "./Dapptutorial.sol";

contract DapptutorialTest is DSTest {
  Dapptutorial dapptutorial;

  function setUp() public {
    dapptutorial = new Dapptutorial();
  }

  function test_withdraw(uint96 amount) public {
    payable(address(dapptutorial)).transfer(amount);
    uint256 preBalance = address(this).balance;
    dapptutorial.widthraw(42);
    uint256 postBalance = address(this).balance;
    assertEq(preBalance + amount, postBalance);
  }

  function testFail_widthraw_wrong_pass(uint96 amount) public {
    payable(address(dapptutorial)).transfer(amount);
    uint256 preBalance = address(this).balance;
    dapptutorial.widthraw(1);
    uint256 postBalance = address(this).balance;
    assertEq(preBalance + amount, postBalance);
  }

  function proveFail_withdraw(uint256 guess) public {
    payable(address(dapptutorial)).transfer(1 ether);
    uint256 preBalance = address(this).balance;
    dapptutorial.widthraw(guess);
    uint256 postBalance = address(this).balance;
    assertEq(preBalance + 1 ether, postBalance);
  }

  receive() external payable {}
}
