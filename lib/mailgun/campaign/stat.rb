module Mailgun
  class Campaign::Stat

  	# List all Campaign stats
  	def list(domain = Mailgun.domain, campaign_id)
 			Mailgun.submit :get, campaign_stats_url(domain, campaign_id)
  	end

  	private

  	# Helper method to generate the proper url for Mailgun campaign stat API calls
    def campaign_stats_url(domain, campaign_id=nil)
      "#{@mailgun.base_url}/#{domain}/campaigns#{'/' + campaign_id if campaign_id}/stats"
    end

  end
end