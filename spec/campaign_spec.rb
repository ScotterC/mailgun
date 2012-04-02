require 'spec_helper'

describe Mailgun::Campaign do

  before :each do
    @mailgun = Mailgun({:api_key => "api-key"})		# used to get the default values

    @campaign_options = {
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
      .with("#{@mailgun.campaigns.send(:campaign_url, @campaign_options[:domain])}", {:limit => 100, :skip => 0})
      .and_return(sample_response)
    
      @mailgun.campaigns.list @campaign_options[:domain]
    end
  end

  describe "find campaign" do
  	it "should make a GET request with the right params" do
      sample_response = "{\"items\": [{\"size_bytes\": 0,  \"mailbox\": \"postmaster@bsample.mailgun.org\" }  ]}"
      RestClient.should_receive(:get)
      .with("#{@mailgun.campaigns.send(:campaign_url, @campaign_options[:domain], @campaign_options[:campaign])}", {})
      .and_return(sample_response)
    
      @mailgun.campaigns.find(@campaign_options[:domain], @campaign_options[:campaign])
  	end
  end

  describe "create campaign" do
  	it "should make a POST request with the right params" do
      sample_response = "{\"items\": [{\"size_bytes\": 0,  \"mailbox\": \"postmaster@bsample.mailgun.org\" }  ]}"
      RestClient.should_receive(:post)
      .with("#{@mailgun.campaigns.send(:campaign_url, @campaign_options[:domain])}", {
      	:campaign_id => @campaign_options[:campaign], :name => @campaign_options[:name]
      })
      .and_return(sample_response)
    
      @mailgun.campaigns.create(@campaign_options[:domain], @campaign_options[:campaign],  @campaign_options[:name])
  	end
  end

  describe "delete campaign" do
  	it "should make a DELETE request with the right params" do
      sample_response = "{\"items\": [{\"size_bytes\": 0,  \"mailbox\": \"postmaster@bsample.mailgun.org\" }  ]}"
      RestClient.should_receive(:delete)
      .with("#{@mailgun.campaigns.send(:campaign_url, @campaign_options[:domain], @campaign_options[:campaign])}", {})
      .and_return(sample_response)
    
      @mailgun.campaigns.delete(@campaign_options[:domain], @campaign_options[:campaign])
  	end
  end

end