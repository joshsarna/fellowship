# Fellowship

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fellowship'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fellowship

## Usage

### Basic
```
Fellowship::Fellowship.deep_copy(x) # => x
Fellowship::Fellowship.factorial(5) # => 120
Fellowship::Fellowship.prime?(83) # => true
Fellowship::Fellowship.int_digit(234678, 1)  # => 3
```

### Hash Sorting
```
Fellowship::Fellowship.sort_hashes_by(array_of_hashes, *keys)
```

### Route Finding

```
Fellowship::Fellowship.find_route(start_id, end_id, segments, endpoint1, endpoint2)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joshsarna/fellowship. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Fellowship project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/fellowship/blob/master/CODE_OF_CONDUCT.md).
