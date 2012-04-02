module Mailgun
  class Campaign::Event

    # List all Campaign events
  	def list(domain = Mailgun.domain, campaign_id)
 			Mailgun.submit :get, campaign_events_url(domain, campaign_id)
  	end
  	
  	private

  	# Helper method to generate the proper url for Mailgun campaign events API calls
    def campaign_events_url(domain, campaign_id=nil)
      "#{@mailgun.base_url}/#{domain}/campaigns#{'/' + campaign_id if campaign_id}/events"
    end

  end
end