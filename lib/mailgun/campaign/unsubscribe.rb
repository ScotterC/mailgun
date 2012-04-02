module Mailgun
  class Campaign::Unsubscribe

    # Used internally, called from Mailgun::Base
    def initialize(mailgun, campaign)
      @mailgun = mailgun
      @campaign = campaign
    end

  	# List all Campaign unsubscribes
  	def list(domain = Mailgun.domain, campaign_id)
 			Mailgun.submit :get, campaign_unsubscribes_url(domain, campaign_id), :groupby => 'country'
  	end

  	private

  	# Helper method to generate the proper url for Mailgun campaign unsubscribe API calls
    def campaign_unsubscribes_url(domain, campaign_id=nil)
      "#{@mailgun.base_url}/#{domain}/campaigns#{'/' + campaign_id if campaign_id}/unsubscribes"
    end

  end
end