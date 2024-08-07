# 브랜치 설명

## main

- 다음 사항 이외의 구조적 변경을 최소화한 단순한 구현체
  - `Quiz_item[] public qs;`
  - `receive()`
- 논리적인 허점이 많고, 불필요한 가스가 지출된다.

### gas-report

![image](https://github.com/user-attachments/assets/b9f710c4-32d7-441b-8611-7c4040e49859)

## v2 (준비 중)

- 가스 최적화
- 취약점 일부 보완

---

### log-main

Ran 12 tests for test/Quiz.t.sol:QuizTest
[PASS] testAddQuizGetQuiz() (gas: 187833)
[PASS] testBetToPlay() (gas: 68793)
[PASS] testBetToPlayMax() (gas: 66473)
[PASS] testBetToPlayMin() (gas: 66561)
[PASS] testClaim() (gas: 138941)
[PASS] testFailBetToPlayMax() (gas: 42126)
[PASS] testFailBetToPlayMin() (gas: 39966)
[PASS] testGetQuizSecurity() (gas: 22342)
[PASS] testMultiBet() (gas: 113586)
[PASS] testSolve1() (gas: 109639)
[PASS] testSolve2() (gas: 107774)
Suite result: ok. 12 passed; 0 failed; 0 skipped; finished in 1.66ms (5.67ms CPU time)
| src/Quiz.sol:Quiz contract | | | | | |
|----------------------------|-----------------|-------|--------|--------|---------|
| Deployment Cost | Deployment Size | | | | |
| 1050074 | 4635 | | | | |
| Function Name | min | avg | median | max | # calls |
| addQuiz | 24691 | 96492 | 96492 | 168294 | 2 |
| betToPlay | 25845 | 45673 | 52503 | 52503 | 10 |
| bets | 807 | 807 | 807 | 807 | 3 |
| claim | 33256 | 33256 | 33256 | 33256 | 1 |
| getAnswer | 3581 | 3581 | 3581 | 3581 | 2 |
| getQuiz | 2574 | 3292 | 2574 | 12574 | 14 |
| getQuizNum | 2314 | 2314 | 2314 | 2314 | 2 |
| receive | 43257 | 43257 | 43257 | 43257 | 12 |
| solveQuiz | 35035 | 35124 | 35035 | 35304 | 3 |
| vault_balance | 362 | 1362 | 1362 | 2362 | 2 |
