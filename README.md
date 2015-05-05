# alexslist

A very simple craigslist type application

## Running alexslist

	bundle install
	rake db:create db:migrate db:seed
	rails server

Fire it up and sign up with the link on the top right. Once you're logged in you can create listings, categories and edit them. They are listed on the home page and call the listing details with Rails ajax calls. 

## Test alexslist

	rspec -fd

I did a few of each type of test:
Unit Tests are in /specs/unit/.
Integration tests are done with Capybara in /spec/features/.