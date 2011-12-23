require 'spec_helper'

describe OmniAuth::Strategies::Meetup do
  subject do
    OmniAuth::Strategies::Meetup.new(nil, @options || {})
  end

  it_should_behave_like 'an oauth2 strategy'

  describe '#client' do
    it 'should have the correct meetup site' do
      subject.client.site.should eq("https://api.meetup.com")
    end

    it 'should have the correct authorization url' do
      subject.client.options[:authorize_url].should eq("https://secure.meetup.com/oauth2/authorize")
    end

    it 'should have the correct token url' do
      subject.client.options[:token_url].should eq('https://secure.meetup.com/oauth2/access')
    end
  end

  describe '#callback_path' do
    it 'should have the correct callback path' do
      subject.callback_path.should eq('/auth/meetup/callback')
    end
  end
end
