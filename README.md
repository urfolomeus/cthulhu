# Cthulhu

Cthulhu is an application that helps with the character side of things in a game of Chaosium's Call of Cthulhu RPG.


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
