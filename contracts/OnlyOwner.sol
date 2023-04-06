pragma solidity >=0.4.22 <=0.8.17;

contract OnlyOwner {
    uint8 value;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function add(uint8 number) public {
        require(msg.sender == owner, "only the owner can use this function");
        value += number;
    }

    function subtract(uint8 number) public {
        require(msg.sender == owner, "only the owner can use this function");
        value -= number;
    }

    function get() public view returns (uint8) {
        require(msg.sender == owner);
        return value;
    }
}