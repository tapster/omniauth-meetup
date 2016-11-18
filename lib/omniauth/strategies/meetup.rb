require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    # Meetup omniauth-oauth2 strategy
    class Meetup < OmniAuth::Strategies::OAuth2
      option :name, 'meetup'

      option :client_options,
             site: 'https://api.meetup.com',
             authorize_url: 'https://secure.meetup.com/oauth2/authorize',
             token_url: 'https://secure.meetup.com/oauth2/access'

      def request_phase
        super
      end

      uid { raw_info['id'] }

      info do
        {
          id: raw_info['id'],
          name: raw_info['name'],
          photo_url: meetup_photo_url,
          image: meetup_photo_url,
          urls: { public_profile: raw_info['link'] },
          description: raw_info['bio'],
          location: meetup_location
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= JSON.parse(access_token.get('/2/member/self').body)
      end

      private

      def meetup_location
        [raw_info['city'], raw_info['state'], raw_info['country']].reject do |v|
          !v || v.empty?
        end.join(', ')
      end

      def meetup_photo_url
        raw_info.key?('photo') ? raw_info['photo']['photo_link'] : nil
      end
    end
  end
end
