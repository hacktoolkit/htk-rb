## help - Display help about make targets for this Makefile
help:
	@cat Makefile | grep '^## ' --color=never | cut -c4- | sed -e "`printf 's/ - /\t- /;'`" | column -s "`printf '\t'`" -t

## clean - Removes all build artifacts
clean:
	rm -f *.gem

## build - Builds the Ruby Gem
build: clean
	gem build htk.gemspec

## release - Releases the Ruby Gem
release: build
	gem push htk-*.gem
