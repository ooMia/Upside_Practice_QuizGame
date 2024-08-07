// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Quiz {
    struct Quiz_item {
        uint id;
        string question;
        string answer;
        uint min_bet;
        uint max_bet;
    }

    mapping(address => uint256)[] public bets;
    Quiz_item[] public qs;
    uint public vault_balance;

    constructor() {
        Quiz_item memory q;
        q.id = 1;
        q.question = "1+1=?";
        q.answer = "2";
        q.min_bet = 1 ether;
        q.max_bet = 2 ether;
        addQuiz(q);
    }

    function addQuiz(Quiz_item memory q) public {
        require(msg.sender > address(0x0a), "no precompiled contract");
        qs.push(q);
        bets.push();
    }

    function getAnswer(uint quizId) public view returns (string memory) {}

    function getQuiz(uint quizId) public view returns (Quiz_item memory) {
        Quiz_item storage q = qs[quizId - 1];
        return Quiz_item(q.id, q.question, "", q.min_bet, q.max_bet);
    }

    function getQuizNum() public view returns (uint) {
        return qs.length;
    }

    function betToPlay(uint quizId) public payable {
        Quiz_item storage q = qs[quizId - 1];
        require(msg.value >= q.min_bet && msg.value <= q.max_bet);
        bets[quizId - 1][msg.sender] += msg.value;
    }

    function solveQuiz(uint quizId, string memory ans) public returns (bool) {}

    function claim() public {}

    receive() external payable {
        vault_balance += msg.value;
    }
}
