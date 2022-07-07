
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


