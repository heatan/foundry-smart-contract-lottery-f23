//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {DeployRaffle} from "../../script/DeployRaffle.s.sol";
import {Raffle} from "../../src/Raffle.sol";
import {HelperConfig} from "../../script/HelperConfig.s.sol";
import {Test, console} from "lib/forge-std/src/Test.sol";
import {Vm} from "lib/forge-std/src/Vm.sol";

contract RaffleTest is Test {
    Raffle public raffle;
    HelperConfig public helperConfig;

    uint64 subscriptionId;
    bytes32 gasLane;
    uint256 interval;
    uint256 enteranceFee;
    uint32 callbackGasLimit;
    address vrfCoordinatorV2;

    address public PLAYER = makeAddr("player");

    function setUp() external {
        DeployRaffle deplyer = new DeployRaffle();
        (raffle, helperConfig) = deployer.run();
        vm.deal(PLAYER);
        (
            ,
            gasLane,
            Interval,
            entranceFee,
            callbackGasLimit,
            vrfCoordinatorV2,
            ,
        ) = helperConfig.activeNetworkconfig();
    }

    function testRaffleInitializesInOpenState() public view {
        assert(raffle.getRaffleState() == Raffle.RaffleState.OPEN);
    }

    function testRaffleRecordsPlayerWhenTheyEnter() public {
        vm.prank(PLAYER);
        raffle.enterRaffle{ value: raffleEntranceFee}();

        address playerRecorded = raffle.getPlayer(0);
            assertEq(fundMe.MINIMUM_USD(), 5e18);
    }
}
