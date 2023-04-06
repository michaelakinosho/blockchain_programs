pragma solidity >=0.4.22 <=0.8.17;

contract Following {
    mapping(address => address[]) following;

    function follow(address toFollow) public {
        require(
            following[msg.sender].length < 3,
            "user is already following the maximum number of users"
        );
        require(msg.sender != toFollow, "you cannot follow yourself");
        following[msg.sender].push(toFollow);
    }

    function getFollowing(address addr) public view returns (address[] memory) {
        return following[addr];
    }

    function clearFollowing() public {
        delete following[msg.sender];
    }
}