# Cthulhu

Cthulhu is an application that helps with the character side of things in a game of Chaosium's Call of Cthulhu RPG.


## Setup

Once you've cloned the project, run `mix do deps.get deps.compile`. You can check that everything is working by running the tests.

We use an environment variable called `SLACK_API_TOKEN` in dev and test environments to set the API token for the Slack Bot. This is because we use Travis as a CI server and it's easier to use env vars for these things. However when we build a release for production we use the **config/prod.secret.exs** file instead. Get the Slack API token and put it in both places.


## Tests

Tests for the all applications can be run by running `mix test` in the umbrella root. Individual application tests can be run by going to the app's root directory and running `mix test`.

We use [Credo](http://github.com/rrene/credo) for linting. You can run the Credo linter by running `mix credo`. We default to strict mode.


## Deployment

We use Docker and Distillery to generate releases. All you need to do to setup deploys is adjust `deploy/deploy.sh` to point to your server, ensuring that the user you specified for SSH has SSH privileges on that server.

To deploy, run: `./deploy/deploy.sh`


## Running

To run locally, run `iex -S mix`.


## Features

The following are features currently implemented:

### Rolling

* Roll a single d6
* Roll multiple d6
* Roll multiple d4
* Roll multiple d8
* Roll multiple d10
* Roll multiple d12
* Roll multiple d20
* Roll multiple d100
* Roll with modifiers

### Interface

* Slack bot


## Roadmap

The following are features that may be developed in future (not an exhaustive list):

### Rolling

* Roll against attribute (requires character sheet)
* Roll against skill (requires character sheet)
* Bonus dice
* Penalty dice
* Opposed rolls

### Interface

* Web interface
* Facebook Messenger
* SMS

### User

* A user can sign up for an account
* A user can edit their account
* A user can change their password
* A user can link their Slack account on a given team
* A user can link their Facebook account

### Character

* Roll a new PC
  * Roll attributes
    * STR, CON, DEX, APP, POW (`3d6 * 5`)
    * SIZ, INT (`2d6+6 * 5`)
    * EDU (`(2d6+6 * 5) + (attr_check(:edu) > EDU ? 1d10 : 0)`)
  * Allow user to mulligan their attributes
  * Allow for different attribute rolling techniques
  * Calculate
    * Effects of age (if any)
    * Sanity points (`POW`)
    * Magic points (`floor(POW/5)`)
    * Luck (`3d6 * 5`)
    * Hit points (`floor((SIZ + CON) / 10)`)
    * MOV (see rules)
  * Set occupation
    * Ask user for occupation
    * Ask user for any additional professional skills
    * Ask user for any skill specialisations
    * Ask user for any additional personal interest skills
    * Ask user to assign occupational skill points across occupation skills
    * Ask user to assign `INT * 2` points across all skills
  * Calculate
    * Damage Bonus
    * Build
    * Dodge
    * Finances
     * Spending level
     * Cash
     * Assets
  * Personalisation and back story
    * Roll back story
      * Ideology
      * Significant person
      * Meaningful location
      * Treasured possession
      * Traits
    * Allow user to re-roll backstory
    * Allow user to override backstory
    * Ask user for character's
      * Personal description
      * Name
      * Age
        * Calculate effects of age (if any)
      * Sex
      * Residence
      * Birthplace
  * Persisting and accessing
    * Persist a character sheet once rolled
    * Link a character sheet to a user
* Roll a new NPC
