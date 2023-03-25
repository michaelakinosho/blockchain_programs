pragma solidity >=0.4.22 <=0.8.17;

contract Voting {    
    mapping (address => bool) voted;
    mapping (uint8 => uint8) votes;
    uint8 currentWinner;
    uint8 mostVotes;

    function vote(uint8 number) public {
        require(!voted[msg.sender],"Sender has voted");
        require(number >= 1 && number <= 5,"Number is not between 1 and 5");
        
        voted[msg.sender] = true;
        votes[number]++;

        if (votes[number] >= mostVotes) {
            currentWinner = number;
            mostVotes = votes[number];
        }
    }

    function getVotes(uint8 number) public view returns (uint8) {
        require(number >= 1 && number <= 5,"Number is not between 1 and 5");
        return votes[number];
    }

    function getCurrentWinner() public view returns (uint8) {
        if (currentWinner == 0) {
            return 1;
        }
        
        return (currentWinner);
    }
}