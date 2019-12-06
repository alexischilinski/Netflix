# Movie Finder

This CLI app is used to recommend movies to users.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites and Installing

This CLI was built with Ruby, Sqlite3, and Active Record. All of the gems are already in the Gemfile, so you only need to run this command

```
bundle install
```
in the terminal to add them. Gems include:
* pry
* rake
* activerecord
* sinatra-activerecord
* sqlite3
* require_all
* tty-prompt
* tty-fonts
* colorize
* pastel

### Running the CLI

To start the program, type:

```
ruby runner.rb
```

in the terminal and follow the prompts!

You will be able to choose a username, find a movie and see various information about the movie and add it to your watchlist. You can also delete movies from your watchlist.

* [Video](https://www.youtube.com/watch?v=4n9zBiafrec&feature=youtu.be) - video demo with existing user
* [Video](https://www.youtube.com/watch?v=P_m9tMBdsAg&feature=youtu.be) - video demo with new user

## Built With

* [TTYToolkit](https://ttytoolkit.org/components/) - tty-prompt gem, tty-fonts
* [fazibear/colorize](https://github.com/fazibear/colorize?source=post_page-----30769d6912d5----------------------) - colorize gem
* [piotrmurach/pastel](https://github.com/piotrmurach/pastel) - pastel gem

## Authors

* **Alexis Chilinski**

## Acknowledgments

* Thanks Jesse! :)
