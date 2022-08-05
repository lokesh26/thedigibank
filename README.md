
# TheDigiBank

## Getting Started

### Prerequisites

Before setting up the app locally, make sure you have the following:

1. Install Ruby version 2.5 or higher

### Development Setup

To setup the App locally, you will need to go through the following steps.

1. Setup MySQL following the instructions
	
- `brew install mysql@5.7`

- `brew postinstall` has run succesfully (you might need to clear `/usr/local/etc/my.cnf` and `rm -rf /usr/local/var/mysql`)

- `echo 'export PATH="/usr/local/opt/mysql@5.7/bin:\$PATH"' >> ~/.zshrc` (or equivalent depending on your bash)

- Reload your terminal

- Update the database.yml file with password	

3. Do a bundle install.

4. Create and migrate/seed the database

```
rails db:create
rails db:migrate
```

5. Run the development server using `rails s`

6. Create User and Account from Console. Use the schema.rb to get the required fields

## Testing

### Rspec

Prepare test database
```
rails db:test:prepare
```

To run all specs
```
bundle exec rspec
```

To run all specs in one file
```
bundle exec rspec <path/to/spec/file>
```

To run one specific test
```
bundle exec rspec <path/to/spec/file>:<line number of test>
```

## Design

### Transaction Safety

- Devise for Authentication

- Safe routing

- Database validations and tests for safeguarding transactions

- Controller checks

### Future Extensions

- Devise lockable to lock after account after certain login attempts

- Logout session after a few minutes

- Front end Validations and UI improvements

- Controller Specs

- More specs for Models


## Problem statement

Introduction
The key to the assignment is the method and technique. The user interface is less important. The test case can be performed from the comfort of your home. We would like to receive a notification of when you have completed the assignment. The project can be uploaded to your personal code repository (e.g. GitHub) and the URL to repository can be sent per email.
Assignment - The Ruby Bank
1. Build a simple Rails banking app
2. Via the console you can create users with password
3. Via the console you can give the user credit
4. The user must be able to log in
5. User has a bank account with balance
6. Users can transfer money to each other through the UI
7. Users may not have a negative balance on their account
8. It must be traceable how a user obtained a certain balance
Expectations
• The project is structured in a logical way that allows future extensions in
terms of functionality and maintainability
• Make sure that money is transferred safely between accounts
• Our Quality Assurance engineer should be able to understand the build-up
of your application and know what and how you have tested already
• Make use of appropriate code conventions as much as possible
