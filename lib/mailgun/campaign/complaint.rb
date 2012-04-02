module Mailgun
  class Campaign::Complaint

  	# List all Campaign complaints
  	def list(domain = Mailgun.domain, campaign_id)
 			Mailgun.submit :get, campaign_complaints_url(domain, campaign_id)
  	end

  	private

  	# Helper method to generate the proper url for Mailgun campaign complaint API calls
    def campaign_complaints_url(domain, campaign_id=nil)
      "#{@mailgun.base_url}/#{domain}/campaigns#{'/' + campaign_id if campaign_id}/complaints"
    end

  end
end