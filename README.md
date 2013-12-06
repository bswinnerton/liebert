# Liebert
[![Build Status](https://travis-ci.org/bswinnerton/liebert.png)](https://travis-ci.org/bswinnerton/liebert)
[![Code Climate](https://codeclimate.com/github/bswinnerton/liebert.png)](https://codeclimate.com/github/bswinnerton/liebert)

Liebert is a gem that allows you to gather metrics from [Liebert](http://www.emersonnetworkpower.com/en-US/Brands/liebert/Pages/default.aspx) based products and display them in a format digestable by [Ganglia](http://ganglia.sourceforge.net/).

## Installation

Add this line to your application's Gemfile:

    gem 'liebert'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install liebert

## Usage

To utilize this gem, simply set the URLs to your liebert products in environment variables:

AC Unit:  
```
export LIEBERT_AIRCONDITIONER_HOSTNAME='liebertac.mydomain.com'
```

UPS Unit:  
```
export LIEBERT_UPS_HOSTNAME='liebertups.mydomain.com'
```

And then you can run:

```
liebert <unit> --params
```

e.g.

```
liebert ac --all
liebert ac --temperature
liebert ac
leibert ups
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
