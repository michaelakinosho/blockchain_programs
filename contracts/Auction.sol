pragma solidity >=0.7.0 <0.9.0;

contract Auction {
    address owner;
    uint highestBid;
    address highestBidder;
    mapping(address => uint) oldBids;

    event Bid(address indexed bidder, uint value);
    event StopAuction(address indexed highestBidder, uint highestBid);

    constructor() {
        owner = msg.sender;
    }

    function bid() external payable {
        require(msg.value > highestBid);
        require(owner != msg.sender, "owner cannot bid");
        oldBids[highestBidder] = highestBid;
        highestBid = msg.value;
        highestBidder = msg.sender;
        emit Bid(msg.sender, msg.value);
    }

    function withdraw() external {
        require(msg.sender != owner, "owner cannot withdraw");
        uint value = oldBids[msg.sender];
        oldBids[msg.sender] = 0;
        (bool sent,) = payable(msg.sender).call{value: value}("");
        require(sent, "payment failed");
    }

    function stopAuction() external {
        require(msg.sender == owner);
        emit StopAuction(highestBidder, highestBid);
        selfdestruct(payable(owner));
    }
}