require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Meetup < OmniAuth::Strategies::OAuth2
      option :name, "meetup"

      option :client_options, {
        :site => "https://api.meetup.com",
        :authorize_url => 'https://secure.meetup.com/oauth2/authorize',
        :token_url => 'https://secure.meetup.com/oauth2/access'
      }

      def request_phase
        super
      end

      uid{ raw_info['id'] }

      info do
        {
          :id => raw_info['id'],
          :name => raw_info['name'],
          :photo_url => (raw_info['photo'].present? ? raw_info['photo']['photo_link'] : nil),
          :urls => { 'public_profile' => raw_info['link'] },
          :description => (raw_info['bio']),
          :location => (raw_info['city'] + "#{ if !raw_info['state'].blank? then ', ' + raw_info['state'] end }, " + raw_info['country'])
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= JSON.parse(access_token.get("/2/member/self?key=#{access_token.token}&access_token=#{access_token.token}").body)
      end

    end
  end
end
