module Mailgun
  class Campaign::Open

   	# List all Campaign opens
  	def list(domain = Mailgun.domain, campaign_id)
 			Mailgun.submit :get, campaign_opens_url(domain, campaign_id)
  	end

  	private

  	# Helper method to generate the proper url for Mailgun campaign opens API calls
    def campaign_opens_url(domain, campaign_id=nil)
      "#{@mailgun.base_url}/#{domain}/campaigns#{'/' + campaign_id if campaign_id}/opens"
    end

  end
end