# OmniAuth Meetup

`OmniAuth::Strategies::Meetup` is an OmniAuth strategy for authenticating to
meetup.com with OAuth2. Read detailed information about the meetup.com
implementation of OAuth2
[here](http://www.meetup.com/meetup_api/auth/#oauth2)

## Installing

Add to your `Gemfile`:

```ruby
    gem 'omniauth-meetup'
```

Then `bundle install`.

## Usage

To get stared you will need to register an OAuth Consumer in your
meetup.com account
[here](http://www.meetup.com/meetup_api/oauth_consumers/)

Here's a quick example, adding the middleware to a Rails app in
`config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['MEETUP_KEY'], ENV['MEETUP_SECRET']
end
```

## License

Copyright (c) 2011 by Miles Woodroffe

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
