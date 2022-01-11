lint:
	bundle exec rubocop .

format:
	bundle exec rbprettier --write ./app
