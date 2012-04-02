require 'spec_helper'

describe Mailgun::Campaign::Click do

  before :each do
    @mailgun = Mailgun({:api_key => "api-key"})		# used to get the default values

    @campaign_click_options = {
      :email  => "test@sample.mailgun.org",
      :name   => "test",
      :domain => "sample.mailgun.org",
      :campaign => 'new_campaign'
    }
  end

  describe "list campaigns" do
    it "should make a GET request with the right params" do
      sample_response = "{\"items\": [{\"size_bytes\": 0,  \"mailbox\": \"postmaster@bsample.mailgun.org\" }  ]}"
      RestClient.should_receive(:get)
      .with("#{@mailgun.campaigns.send(:campaign_clicks_url, @campaign_click_options[:domain])}", {})
      .and_return(sample_response)
    
      @mailgun.campaigns.list @campaign_click_options[:domain]
    end
  end

end