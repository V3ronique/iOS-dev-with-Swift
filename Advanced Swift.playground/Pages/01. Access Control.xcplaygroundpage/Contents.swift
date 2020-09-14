//// Create a checking account for John. Deposit $300.00
let johnChecking = CheckingAccount()
johnChecking.deposit(amount: 300.00)

//// Write a check for $200.00
let check = johnChecking.writeCheck(amount: 200.0)!

//// Create a checking account for Jane, and deposit the check.
let janeChecking = CheckingAccount()
janeChecking.deposit(check)
//janeChecking.balance // 200.00

//// Try to cash the check again. Of course, it had no effect on
//// Jane’s balance this time :]
janeChecking.deposit(check)
//janeChecking.balance // 200.00

// Create a checking account for John. Deposit $300.00
johnChecking.deposit(amount: 300.00)

