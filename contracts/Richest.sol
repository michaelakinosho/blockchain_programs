pragma solidity >=0.4.22 <=0.8.17;

contract Richest {
    address richest;
    uint256 mostSent;
    mapping (address => uint256) pendingWithdrawals;

    function becomeRichest() external payable returns (bool) {
        if (msg.value <= mostSent) {
            return false;
        }

        pendingWithdrawals[richest] += mostSent;
        richest = msg.sender;
        mostSent = msg.value;
        return true;
    }

    function withdraw() external {
        uint256 amount = pendingWithdrawals[msg.sender];
        // important to do this before transferring the funds to avoid reentrance
        pendingWithdrawals[msg.sender] = 0;
        (bool sent,) = payable(msg.sender).call{value: amount}("");
        require(sent);
    }

    function getRichest() public view returns (address) {
        return richest;
    }
}