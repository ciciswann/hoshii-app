# Hoshii App
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

An app to view all upcoming mechanical keyboard groupbuys and add them to wishlists. 

<p align="center"><img src="hoshii.gif" width="700px"/></p>


## Features

### Wishlist

Create and update wishlists. Browse groupbuys and add them to your wishlists. 

### Sorting & Search 

Filter groupbuys by their status or item type. Search for a groupbuy by its name.

### Third-party sign-up and login

Users can sign-up and login via Github. To run this feature, follow these steps:

[Register a new OAuth Application with Github](https://github.com/settings/applications/new)<br>
After installing all gem dependencies:
```$ bundle exec figaro install``` <br>
This creates a commented config/application.yml file and adds it to your .gitignore.<br>

Add your Github developer credentials to the application.yml file: <br>
GITHUB_KEY: {add your appID here} <br>
GITHUB_SECRET: {{add your app secret here}} <br>
Restart your app, you should now see the "Sign in with Github" button in your signup page. <br>

## Supported Versions

* Ruby ~> 2.6.0
* Rails 6.1.3
* SQLite 3.32.3

## Installation Guide

Fork and clone repo

Install all gem dependencies: `bundle install`

Create database scheme with migration: `rails db:migrate`

Seed database: `rails db:seed`

Start local server: `rails s`

Go to localhost via: `http://localhost:3000`

## Contributing

Bug reports and pull requests are welcome. Please open issues to provide feedback.
