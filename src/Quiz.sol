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

    mapping(uint => mapping(address => uint256)) public bets;
    Quiz_item[] private qs;
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
    }

    function getAnswer(uint quizId) public view returns (string memory) {
        return _getQuizById(quizId).answer;
    }

    function getQuiz(uint quizId) public view returns (Quiz_item memory) {
        Quiz_item memory _q = _getQuizById(quizId);
        return Quiz_item(_q.id, _q.question, "", _q.min_bet, _q.max_bet);
    }

    function getQuizNum() public view returns (uint) {
        return qs.length;
    }

    function betToPlay(uint quizId) public payable {
        Quiz_item memory _q = _getQuizById(quizId);
        require(msg.value >= _q.min_bet && msg.value <= _q.max_bet);
        _addBetsByQuizId(quizId, msg.value);
    }

    function solveQuiz(uint quizId, string memory ans) public returns (bool) {
        uint cur = _getBetsByQuizId(quizId);
        if (
            keccak256(abi.encode(ans)) ==
            keccak256(abi.encode(getAnswer(quizId)))
        ) {
            _addBetsByQuizId(quizId, cur);
            return true;
        } else {
            vault_balance += cur;
            _setBetsByQuizId(quizId, 0);
            return false;
        }
    }

    function claim() public {
        uint quizId = getQuizNum();
        uint256 prize = _getBetsByQuizId(quizId);
        _setBetsByQuizId(quizId, 0);
        vault_balance -= prize;
        msg.sender.call{value: prize}("");
    }

    receive() external payable {
        vault_balance += msg.value;
    }

    function _getBetsByQuizId(uint quizId) internal view returns (uint256) {
        return bets[quizId - 1][msg.sender];
    }

    function _setBetsByQuizId(uint quizId, uint256 amount) internal {
        bets[quizId - 1][msg.sender] = amount;
    }

    function _addBetsByQuizId(uint quizId, uint256 amount) internal {
        bets[quizId - 1][msg.sender] += amount;
    }

    function _getQuizById(
        uint quizId
    ) internal view returns (Quiz_item memory) {
        return qs[quizId - 1];
    }
}
