// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Voting {
    mapping(address user => uint256 voteNum) public votm;

    mapping(address user => bool flag) public flagm;

    address[] public  users;

    function vote (address user) public {
        if(flagm[user]) {
            votm[user] = votm[user] + 1;
        }else {
            votm[user] = 1;
            flagm[user] = true;
            users.push(user);
        }
    
    }

    function getVotes(address user) public view returns(uint256) {
        return votm[user];
    }

    function resetVotes() public {
        for(uint256 i = 0;i<users.length;i++) {
            delete votm[users[i]];
            delete flagm[users[i]];
        }
        delete users;
    }
}