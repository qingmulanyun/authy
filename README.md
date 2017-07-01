# code_test

## Introduction

Whilst the purpose of this code test is to display your abilities, it is also an opportunity to express your individuality and coding style. Feel free to extend the requirements, include additional feautres, and implement your own best practices.

- This should be a Rails 5.1 application.

- The application requires for you to implement a User model.

- The User model should leverage the Clearance (https://github.com/thoughtbot/clearance) gem for authentication.

- When a visitor reaches the root route they should see a button that directs them to create a login. You should ask for the standard information needed to setup a User, along with any additional aspects you wish to include.

- After successfully creating a user account you should use Authy (https://authy.com/) (https://github.com/authy/authy-ruby) to create a user and update the associated Authy ID.

- Following the creation of an account the user should have the option to login to view a restricted route (perhaps leverage Clearance’s built in constraints).

- After a successful sign in the user should be prompted to enter their Authy verification token, or request the code via SMS or call.

- If successful, the user should be able to sign in, if verification fails the appropriate error should be displayed.

- Once logged in, the user should be able to update their information. Use AJAX to allow this to happen without the need for a page refresh.

- You should use the Pundit (https://github.com/elabs/pundit) gem for Authorisation and ensure that all routes/actions are authorised.

- To use Authy you will need API keys, please use the following keys: 'Ef4FOZcWLOEuvR5HDwD2UF024sj3942y'

## Submission

- Please clone a copy of this repository and create a new branch with your name. Please push this new branch to the repository when finished.

## Rules

- Express yourself and your coding style. For example if you believe that well tested code is good code, then write the appropriate tests.

- Feel free to implement additional aspects such as decorators, service classes, etc.

- Have fun!
