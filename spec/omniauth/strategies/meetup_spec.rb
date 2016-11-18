require 'spec_helper'

describe OmniAuth::Strategies::Meetup do
  subject do
    OmniAuth::Strategies::Meetup.new(nil, @options || {})
  end

  describe '#client' do
    it 'has a correct api url' do
      expect(subject.client.site).to eq('https://api.meetup.com')
    end

    it 'has a correct api authorization url' do
      expect(subject.client.options[:authorize_url]).to eq('https://secure.meetup.com/oauth2/authorize')
    end

    it 'has a correct api token auth url' do
      expect(subject.client.options[:token_url]).to eq('https://secure.meetup.com/oauth2/access')
    end
  end

  describe '#callback_path' do
    it 'has a correct callback path' do
      expect(subject.callback_path).to eq('/auth/meetup/callback')
    end
  end

  describe '#uid' do
    it 'returns the uid from raw_info' do
      allow(subject).to receive(:raw_info).and_return('id' => '999')
      expect(subject.uid).to eq('999')
    end
  end

  describe '#info' do
    it 'returns the name from raw_info' do
      allow(subject).to receive(:raw_info).and_return('name' => 'Bert')
      expect(subject.info[:name]).to eq('Bert')
    end

    it 'returns the photo_url from raw_info if available' do
      allow(subject).to receive(:raw_info).and_return('photo' => { 'photo_link' => 'http://meetup.com/bert.jpg' })
      expect(subject.info[:photo_url]).to eq('http://meetup.com/bert.jpg')
      allow(subject).to receive(:raw_info).and_return({})
      expect(subject.info[:photo_url]).to eq(nil)
    end

    it 'returns the image from raw_info if available' do
      allow(subject).to receive(:raw_info).and_return('photo' => { 'photo_link' => 'http://meetup.com/bert.jpg' })
      expect(subject.info[:image]).to eq('http://meetup.com/bert.jpg')
      allow(subject).to receive(:raw_info).and_return({})
      expect(subject.info[:image]).to eq(nil)
    end

    it 'returns the public_profile url' do
      allow(subject).to receive(:raw_info).and_return('link' => 'http://meetup.com/bert')
      expect(subject.info[:urls][:public_profile]).to eq('http://meetup.com/bert')
    end

    it 'returns the description from raw_info' do
      allow(subject).to receive(:raw_info).and_return('bio' => 'My name is Bert.')
      expect(subject.info[:description]).to eq('My name is Bert.')
    end

    it 'returns the location from raw_info' do
      allow(subject).to receive(:raw_info).and_return('city' => 'Los Angeles', 'state' => 'CA', 'country' => 'USA')
      expect(subject.info[:location]).to eq('Los Angeles, CA, USA')
      allow(subject).to receive(:raw_info).and_return('city' => 'Tokyo', 'country' => 'Japan')
      expect(subject.info[:location]).to eq('Tokyo, Japan')
      allow(subject).to receive(:raw_info).and_return({})
      expect(subject.info[:location]).to eq('')
    end
  end
end
