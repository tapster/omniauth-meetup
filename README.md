# OmniAuth Meetup

[![Build
Status](https://secure.travis-ci.org/tapster/omniauth-meetup.png)](http://travis-ci.org/tapster/omniauth-meetup)

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

To get started you will need to register an OAuth Consumer in your
meetup.com account
[here](http://www.meetup.com/meetup_api/oauth_consumers/)

Here's a quick example, adding the middleware to a Rails app in
`config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :meetup, ENV['MEETUP_KEY'], ENV['MEETUP_SECRET']
end
```
or with Devise

```ruby
  config.omniauth :meetup, ENV['MEETUP_KEY'], ENV['MEETUP_SECRET'], callback_url: 'http://example.com/users/auth/meetup/callback'
```
**Starting from version 1.4 in omniauth-oauth2 you must provide same callback url you have provided on API dashboard otherwise authentication won't work.**

You can then implement your authentication as usual with OmniAuth as
shown in the excellent [Railscast
241](http://railscasts.com/episodes/241-simple-omniauth)

##Authentication Hash

Here's an example *Authentication Hash* available in
`request.env['omniauth.auth']`:

```ruby
{"provider"=>"meetup",
 "uid"=>0,
 "info"=>
  {"id"=>0,
   "name"=>"elvis",
   "photo_url"=>"http://photos3.meetupstatic.com/photos/member_pic_0.jpeg"},
 "credentials"=>
  {"token"=>"abc123...",         # OAuth 2.0 access_token, which you may wish to store
   "refresh_token"=>"bcd234...", # This token can be used to refresh your access_token later
   "expires_at"=>1324720198,     # when the access token expires (Meetup tokens expire in 1 hour)
   "expires"=>true},
 "extra"=>
  {"raw_info"=>
    {"lon"=>-90.027181,
     "link"=>"http://www.meetup.com/members/0",
     "lang"=>"en_US",
     "photo"=>
      {"photo_link"=> "http://photos3.meetupstatic.com/photos/member_pic_0.jpeg",
       "highres_link"=> "http://photos1.meetupstatic.com/photos/member_pic_0_hires.jpeg",
       "thumb_link"=> "http://photos1.meetupstatic.com/photos/member_pic_0_thumb.jpeg",
       "photo_id"=>0},
     "city"=>"Memphis",
     "country"=>"us",
     "visited"=>1325001005000,
     "id"=>0,
     "topics"=>[],
     "joined"=>1147652858000,
     "name"=>"elvis",
     "other_services"=>{"twitter"=>{"identifier"=>"@elvis"}},
     "lat"=>35.046677
    }
  }
}
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
