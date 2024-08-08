# 브랜치 설명

## main

- 다음 사항 이외의 구조적 변경을 최소화한 단순한 구현체
  - `Quiz_item[] public qs;`
  - `receive()`

### gas-report

![image](https://github.com/user-attachments/assets/252ccb59-9df4-40da-b1e0-447fd7a3011e)

## v2

- 리팩토링으로 가스 최적화 및 Deployment Cost 개선
- gas-report 기준, Deployment Cost `950,293`에서 `845,130`로 약 10% 개선
- 테스트 기준, 가스 소비량 약 2% 개선

### gas-report

![image](https://github.com/user-attachments/assets/88432c91-af7f-4a39-8d0f-ced6a6bfbadd)

---

### gas-diff

| Test Name             | main    | v2      | Difference |
|-----------------------|---------|---------|------------|
| testAddQuizACL()      | 37086   | 37086   | 0          |
| testAddQuizGetQuiz()  | 187766  | 182785  | -4981      |
| testBetToPlay()       | 68793   | 66801   | -1992      |
| testBetToPlayMax()    | 66473   | 64481   | -1992      |
| testBetToPlayMin()    | 66561   | 64569   | -1992      |
| testClaim()           | 138963  | 138908  | -55        |
| testFailBetToPlayMax()| 42126   | 42169   | 43         |
| testFailBetToPlayMin()| 39966   | 40009   | 43         |
| testGetQuizSecurity() | 22253   | 22296   | 43         |
| testMultiBet()        | 113586  | 109464  | -4122      |
| testSolve1()          | 109661  | 106722  | -2939      |
| testSolve2()          | 107774  | 104083  | -3691      |
| **SUM**               | 1001008 | 979373  | -21635     |
