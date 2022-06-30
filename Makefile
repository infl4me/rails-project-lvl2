lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

format:
	bundle exec rubocop -a