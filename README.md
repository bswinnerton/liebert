# Liebert

Liebert is a gem that allows you to gather metrics from Liebert based products and display them in a format digestable by Ganglia.

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
export LIEBERT_AIRCONDITIONER_URI='http://liebertac.mydomain.com/graphic/env.htm'
```

UPS Unit:  
```
export LIEBERT_UPS_URI='http://liebertups.mydomain.com/graphic/smallUps.htm'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
