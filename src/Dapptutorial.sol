// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

contract Dapptutorial {
  receive() external payable {}

  function widthraw(uint256 password) public {
    require(password == 42, "Access denied");
    payable(msg.sender).transfer(address(this).balance);
  }
}
