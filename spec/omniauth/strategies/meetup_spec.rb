require 'spec_helper'

describe OmniAuth::Strategies::Meetup do
  subject do
    OmniAuth::Strategies::Meetup.new(nil, @options || {})
  end

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

  describe '#uid' do
    it 'returns the uid from raw_info' do
      subject.stub(:raw_info) { { 'id' => '999' } }
      subject.uid.should == '999'
    end
  end

  describe '#info' do
    it 'returns the name from raw_info' do
      subject.stub(:raw_info) { { 'name' => 'Bert' }}
      subject.info[:name].should == 'Bert'
    end

    it 'returns the photo_url from raw_info if available' do
      subject.stub(:raw_info) { { 'photo' => { 'photo_link' => 'http://meetup.com/bert.jpg' } }}
      subject.info[:photo_url].should == 'http://meetup.com/bert.jpg'
      subject.stub(:raw_info) {{}}
      subject.info[:photo_url].should == nil
    end

    it 'returns the image from raw_info if available' do
      subject.stub(:raw_info) { { 'photo' => { 'photo_link' => 'http://meetup.com/bert.jpg' } }}
      subject.info[:image].should == 'http://meetup.com/bert.jpg'
      subject.stub(:raw_info) {{}}
      subject.info[:image].should == nil
    end
    
    it 'returns the public_profile url' do
      subject.stub(:raw_info) { { 'link' => 'http://meetup.com/bert' }}
      subject.info[:urls][:public_profile].should == 'http://meetup.com/bert'
    end

    it 'returns the description from raw_info' do
      subject.stub(:raw_info) { { 'bio' => 'My name is Bert.' }}
      subject.info[:description].should == 'My name is Bert.'
    end

    it 'returns the location from raw_info' do
      subject.stub(:raw_info) { { 'city' => 'Los Angeles', 'state' => 'CA', 'country' => 'USA' }}
      subject.info[:location].should == 'Los Angeles, CA, USA'
      subject.stub(:raw_info) { { 'city' => 'Tokyo', 'country' => 'Japan' }}
      subject.info[:location].should == 'Tokyo, Japan'
      subject.stub(:raw_info) {{}}
      subject.info[:location].should == ''
    end
  end
end
