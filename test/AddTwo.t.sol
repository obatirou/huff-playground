// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract AddTwoTest is Test {
    /// @dev Address of the AddTwo contract.  
    AddTwo public addTwoContract;

    /// @dev Setup the testing environment.
    function setUp() public {
        addTwoContract = AddTwo(HuffDeployer.deploy("AddTwo"));
    }

    /// @dev Ensure that you can add two value.
    /// credit to Huffmate
    function testAddTwo(uint256 a, uint256 b) public {
          unchecked {
            uint256 c = a + b;
            if (a > c) {
                vm.expectRevert();
                addTwoContract.addTwo(a, b);
                return;
            }
            uint256 result = addTwoContract.addTwo(a, b);
            assertEq(result, a + b);
        }
    }
}

interface AddTwo {
    function addTwo(uint256, uint256) external returns(uint256);
}
