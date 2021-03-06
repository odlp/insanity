# Insanity [![Build Status](https://travis-ci.org/odlp/insanity.svg?branch=master)](https://travis-ci.org/odlp/insanity)

Run a command repeatedly to check for differences. Handy for discovering flaky tests or verifying a change doesn't lead to instability.

Insanity allows you to:

- See a summary of the exit statuses
- Save the output of each repetition

## Usage

Running the following:

```
insanity 'rspec ./spec/my_flaky_spec.rb' -i 10
```

Will run the command 10 times and output something like:

```
..........

10 iterations complete.

Status 0	| 8 times
Status 1	| 2 times
```

### Command options

- `-i 99` / `--iterations 99`: Number of many times to run the command. Default: 100.
- `-o ./tmp` / `--output-dir ./tmp`: Save output in this directory. Each iteration is written to an individual file (combined stdout & stderr). Default: No output saved.

## Installation

Install the gem directly:

```
gem install insanity
```

Don't forget to run `rbenv rehash` if you use Rbenv.

Alternatively add the following to your Gemfile:

```
gem 'insanity'
```

And run `bundle install`.

## Development notes

- `rake` runs the [RSpec](http://rspec.info/) tests
