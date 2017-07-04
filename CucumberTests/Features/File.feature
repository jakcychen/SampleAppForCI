Feature: Bank Account

Scenario: SignIn

Given ID is "Jacky"
And Password is 12345678
When tape SignIn
Then dismiss SignIn Page


Scenario Outline: Calculate balance

Given balance is <initialBalance>
And annual interest rate is <interestRate>
When calculate interest
Then balance becomes <endBalance>

Examples:
| initialBalance | interestRate | endBalance |
| 1000 |  0.05 | 1050.00 |
| 2000 |  0.03 | 2060.00 |


Scenario: SignOut

Given at Calculate page
When tape SignOut
Then prompt SignIn page
