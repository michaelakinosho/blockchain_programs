pragma solidity >=0.4.22 <=0.8.17;

contract EventEmitter {
    // Write your code here
    mapping(address => uint256) counter;

    event Called(uint256 count, address sender);

    function count() public {
        if (counter[msg.sender] < 1) {
            counter[msg.sender] = 1;
        } else {
            counter[msg.sender]++;
        }
        
        emit Called(counter[msg.sender], msg.sender);
    }
}
