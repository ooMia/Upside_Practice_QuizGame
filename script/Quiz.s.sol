// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "src/Quiz.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
        Quiz quiz = new Quiz();
    }
}
