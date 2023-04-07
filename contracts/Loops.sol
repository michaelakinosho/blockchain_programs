pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {
    function testWhileLoop() public pure {
        while(true) {
            continue;
            break;

        }
    }

    function testForLoop() public pure {
        for (uint i; i < 276; i++) {

        }
    }

    function test(uint maxLoops) public pure returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < maxLoops; i++) {
            sum = sum + i;
        }

        return sum;
    }
}