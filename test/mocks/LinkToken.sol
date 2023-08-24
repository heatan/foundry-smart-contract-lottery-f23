//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@solmate/tokens/ERC20.sol";

interface ERC677Receiver {
    function onTokenTransfer(
        address _sender,
        uint256 _value,
        bytes memory _data
    ) external;
}

contract