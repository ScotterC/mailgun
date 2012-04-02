module Mailgun
  class Campaign::Click

  	# List all Campaign clicks
  	def list(domain = Mailgun.domain, campaign_id)
 			Mailgun.submit :get, campaign_clicks_url(domain, campaign_id)
  	end

  	private

  	# Helper method to generate the proper url for Mailgun campaign clicks API calls
    def campaign_clicks_url(domain, campaign_id=nil)
      "#{@mailgun.base_url}/#{domain}/campaigns#{'/' + campaign_id if campaign_id}/clicks"
    end

  end
end