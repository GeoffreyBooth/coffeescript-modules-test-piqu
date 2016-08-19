This is a test of an update to CoffeeScript that adds support for `import` and `export` statements. It uses the open-source [piqu-ember](https://github.com/pauc/piqu-ember) app, which uses `ember-cli-coffees6`, a plugin for Ember CLI that allows `import` and `export` statements in CoffeeScript without backticks. `ember-cli-coffee6`’s method is to detect the statements via a regex and then pass them through for Babel to parse, essentially wrapping them in backticks. The goal of this test is to remove `ember-cli-coffees6`, replace the CoffeeScript compiler that this app uses with one that adds support for `import` and `export`, and see if the app still works. For further edification, I will put the original and updated-compiler JavaScript output files in the root of the repo for comparison.

## Quickstart

Just one prerequisite: [Docker](https://www.docker.com/products/docker). We’re using an [ember-cli Docker image](https://github.com/danlynn/ember-cli) to contain the ancient version of Ember CLI used by this project, so that you don’t need to have it installed globally on your machine (along with its also-old version of Node.js). Once you have Docker installed (Mac users with [Homebrew Cask](https://caskroom.github.io/) can do `brew cask install docker`), from the root of this repo:

```sh
docker-compose build piqu-updated
docker-compose run --rm npm-updated install
docker-compose run --rm bower-updated install
docker-compose up piqu-updated
# To run the original piqu, replace `updated` with `original` in the commands above
```

Once you see the message that the Ember server has started up, if you go to http://localhost:4200/ in a browser, you should see a webpage with a heading “Welcome to Piqu”. The browser console should have no errors.