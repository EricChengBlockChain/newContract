//storage合约部署位置:
//https://kovan.etherscan.io/address/0x98ee08c125a52a3568e9a32e6dc7166e0ea8848b#code


//storage合约代码:
/**
 *Submitted for verification at Etherscan.io on 2020-12-28
*/

// File: contracts/Storage.sol

pragma solidity 0.5.16;

contract Storage {

  address public governance;
  address public controller;

  constructor() public {
    governance = msg.sender;
  }

  modifier onlyGovernance() {
    require(isGovernance(msg.sender), "Not governance");
    _;
  }

  function setGovernance(address _governance) public onlyGovernance {
    require(_governance != address(0), "new governance shouldn't be empty");
    governance = _governance;
  }

  function setController(address _controller) public onlyGovernance {
    require(_controller != address(0), "new controller shouldn't be empty");
    controller = _controller;
  }

  function isGovernance(address account) public view returns (bool) {
    return account == governance;
  }

  function isController(address account) public view returns (bool) {
    return account == controller;
  }
}


