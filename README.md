# Draft Challenge README

Here are a few explanations for some things I did

## Functional Style

I have a functional programming style. I find it easier to read in 99% of scenarios. I shy away from things like `if` and favor map/hash lookups for branching. I favor modules and functions over classes because I don't like keeping state and behavior together. I'm a huge fan of the Elixir language.

## How to use this

* Fire up postgres
* cd into the `draft_api` folder (this cwd)
* `rake db:create db:migrate`
* `rspec` to run all the regular tests
* `rspec --tag service` to run the super slow test that makes sure we can persist data
* `rake data:fetch_from_cbs` to get all the data from the api and set average ages
* `rails s` to start your server


`/players/:id` will show you details on a single player
`/sports/:sport` will show you all players for a given sport


## Things I might have done differently

### Calculating average ages
The answer here depends on how often new players come into and out of our data set. If it was frequent, I'd set up some kind of message bus and push entry and exit messages across it to constantly keep our average up to date. Or maybe I'd use a cron job if we can deal with some inconsitency.

