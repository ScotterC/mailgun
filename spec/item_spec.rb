require 'spec_helper'

describe Mailgun::Item do

	describe "method missing" do

		it "it should map a hash to methods" do
			sample_data = {'address' => 'test@sample.mailgun.org'}
			item = Mailgun::Item.new(sample_data)
			item.address.should == 'test@sample.mailgun.org'
		end

	end
		
end