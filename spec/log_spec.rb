require 'spec_helper'

describe Mailgun::Log do

  before :each do
    @mailgun = Mailgun({:api_key => "api-key"})		# used to get the default values

    @log_options = {
      :email  => "test@sample.mailgun.org",
      :name   => "test",
      :domain => "sample.mailgun.org"
    }
  end

  describe "list log" do
    it "should make a GET request with the right params" do
      sample_response = "{\"items\": [{\"size_bytes\": 0,  \"mailbox\": \"postmaster@bsample.mailgun.org\" }  ]}"
      RestClient.should_receive(:get).with("#{@mailgun.log.send(:log_url, @log_options[:domain])}", {:limit => 100, :skip => 0}).and_return(sample_response)

      @mailgun.log.list @log_options[:domain]
    end
  end

  describe "log failed" do
    it "should make a GET request with the right params" do
      sample_response = "{\"items\": [{\"size_bytes\": 0,  \"mailbox\": \"postmaster@bsample.mailgun.org\" }  ]}"
      RestClient.should_receive(:get).with("#{@mailgun.log.send(:log_url, @log_options[:domain])}", {:limit => 100, :skip => 0}).and_return(sample_response)

      @mailgun.log.failed @log_options[:domain]
    end
  end

  describe "log delivered" do
    it "should make a GET request with the right params" do
      sample_response = "{\"items\": [{\"size_bytes\": 0,  \"mailbox\": \"postmaster@bsample.mailgun.org\" }  ]}"
      RestClient.should_receive(:get).with("#{@mailgun.log.send(:log_url, @log_options[:domain])}", {:limit => 100, :skip => 0}).and_return(sample_response)

      @mailgun.log.delivered @log_options[:domain]
    end
  end

end