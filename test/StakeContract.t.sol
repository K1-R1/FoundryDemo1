// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.10;

import "ds-test/test.sol";
import "../src/StakeContract.sol";
import "./mocks/MockERC20.sol";
import "./utils/Cheats.sol";

contract StakeContractTest is DSTest {
    StakeContract public stakeContract;
    MockERC20 public mockToken;
    Cheats internal constant cheats = Cheats(HEVM_ADDRESS);

    function setUp() public {
        stakeContract = new StakeContract();
        mockToken = new MockERC20();
    }

    function test_staking_tokens_fuzz(uint8 amount) public {
        mockToken.approve(address(stakeContract), amount);
        cheats.roll(256);
        bool stakePassed = stakeContract.stake(amount, address(mockToken));
        assertTrue(stakePassed);
    }
}
