# Kazan [![Build Status](https://travis-ci.org/khusnetdinov/kazan.svg?branch=master)](https://travis-ci.org/khusnetdinov/kazan) [![Dependency Status](https://gemnasium.com/badges/github.com/khusnetdinov/kazan.svg)](https://gemnasium.com/github.com/khusnetdinov/kazan) [![Code Climate](https://codeclimate.com/github/khusnetdinov/kazan/badges/gpa.svg)](https://codeclimate.com/github/khusnetdinov/kazan)

Kazan creates rails project and setups predefined gems and tools.

![img](http://res.cloudinary.com/dtoqqxqjv/image/upload/c_scale,w_240/v1476011701/147601141068782_rgcl3z.png)

## Dependencies

  TODO

## Installation

Install gem:

    $ gem install kazan

Run:

    $ kazan projectname

## Optional associate services

- TODO: Gitlab CI
- TODO: Gitlab Docker Registry

## Gems

See all gems that will be installed to project in [Gemfile](https://github.com/khusnetdinov/kazan/blob/master/templates/Gemfile.erb)

It includes applications gems:

  - [Dotenv](https://github.com/bkeepers/dotenv) Shim to load environment variables from .env into ENV in development.
  - [I18n](https://github.com/svenfuchs/rails-i18n) is central point to collect locale data for use in Ruby on Rails.
  - [PostgreSQL](https://www.postgresql.org/) database with [PG](https://rubygems.org/gems/pg/versions/0.18.4) adapter is used by defaul.
  - [Puma](http://puma.io/) is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications.
  - [Rails 5.0.0](http://rubyonrails.org/)
  - [Rails Config](https://github.com/railsconfig/config) helps you easily manage environment specific settings in an easy and usable manner.
  - [Simple From](https://github.com/plataformatec/simple_form) aims to be as flexible as possible while helping you with powerful components to create your forms.

It includes assets gems:

It includes development gems:

  - [Annotate](https://github.com/ctran/annotate_models) adds a comment summarizing the current schema.
  - [Awesome Print](https://github.com/awesome-print/awesome_print) prints pretty Ruby objects in full color exposing their internal structure with proper indentation.
  - [Better Errors](https://github.com/charliesome/better_errors) replaces the standard Rails error page with a much better and more useful error page.
  - [ByeBug](https://github.com/deivid-rodriguez/byebug) is a simple to use, feature rich debugger for Ruby 2.
  - [Bundler Audot](https://github.com/rubysec/bundler-audit) is patch-level verification for bundler.
  - [Bullet](https://github.com/flyerhzm/bullet) is designed to help you increase your application's performance by reducing the number of queries it makes.
  - [Foreman](https://github.com/ddollar/foreman) procfile-based applications.
  - [Letter Opener](https://github.com/ryanb/letter_opener) previews email in the default browser instead of sending it.
  - [Listen](https://github.com/guard/listen) listens to file modifications and notifies you about the changes.
  - [Pry](https://github.com/rweng/pry-rails) for interactively exploring objects.
  - [Rack Mini Profiler](https://github.com/MiniProfiler/rack-mini-profiler) displays speed badge for every html page.
  - [Spring](https://github.com/rails/spring) speeds up development by keeping your application running in the background.
  - [Web Console](https://github.com/rails/web-console) is a debugging tool for your Ruby on Rails applications.

It includes tests gems:

 - [Faker](https://github.com/stympy/faker) a port of Perl's Data::Faker library that generates fake data.
 - [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner) is a set of strategies for cleaning your database in Ruby.
 - [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) provides RSpec- and Minitest-compatible one-liners that test common Rails functionality.


## Bonuses

  - [Safe binstubs] (https://github.com/thoughtbot/suspenders/pull/282)

## Other

  TODO

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
