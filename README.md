# What is CryptedHash?


**CryptedHash** is an open source gem, released under the Apache 2 License.

[![Build Status](https://api.travis-ci.org/cybergizer/crypted_hash.svg?branch=master)](http://travis-ci.org/plataformatec/devise)

**Current development status:** idea

## Getting started
Now **CryptedHash** powered by the holy spirit (check current development status above). But in future you'll need:

* Ruby >= 2.3.0
* Rails >= 4.0


## Setup

Add the following line to your Gemfile, please:

```ruby
gem 'crypted_hash'
```

Then run `bundle install` (if you don't have `bundler` gem yet run `gem install bundler` first)


## The Basics

Add and save secrets:
```rb
secrets = CryptedHash.new("secret key")

secrets[:vkontakte] = "kitty123"

secrets.save!("~/.passwords")
```

Load secrets with correct key:
```rb
secrets = CryptedHash.load("~/.passwords", "secret key")

secrets[:vkontakte] #=> "kitty123"
```

Load secrets with wrong key:
```rb
secrets = CryptedHash.load("~/.passwords", "wrong key")

secrets[:vkontakte] #=> "x3p^73b3)"
```

## Changelog

Coming soon


## Additional information

### Contributors

We have a long list of valued contributors. Check them all at:

https://github.com/cybergizer/crypted_hash/graphs/contributors

## License

MIT License. Copyright 2017-2018 Cybergizer. http://cybergizer.com

You are not granted rights or licenses to the trademarks of Cybergizer, including without limitation the CryptedHash name or logo.

