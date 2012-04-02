module Mailgun
	class Campaign
    # Used internally, called from Mailgun::Base
    def initialize(mailgun)
      @mailgun = mailgun
    end

    # List all campaigns
    def list(domain = Mailgun.domain, limit=100, skip=0)
      response = Mailgun.submit :get, campaign_url(domain), {:limit => limit, :skip => skip}

      if response
        response["items"].collect {|item| item["name"]}
      end
    end

    # List a single campaign by a given campaign id
    def find(domain = Mailgun.domain, campaign_id)
      Mailgun.submit :get, campaign_url(domain, campaign_id)
    end

    # Adds a campaign with a given name and id
    def create(domain = Mailgun.domain, campaign_id, name)
      params = {:campaign_id => campaign_id, :name => name}
      Mailgun.submit :post, campaign_url(domain), params
    end

    # Deletes a campaign with a given id
    def delete(domain = Mailgun.domain, campaign_id)
      Mailgun.submit :delete, campaign_url(domain, campaign_id)
    end

    def clicks(domain = Mailgun.domain, campaign_id)
      Mailgun::Campaign::Click.list(domain, campaign_id)
    end

    def complaints(domain = Mailgun.domain, campaign_id)
      Mailgun::Campaign::Complaint.list(domain, campaign_id)
    end

    def events(domain = Mailgun.domain, campaign_id)
      Mailgun::Campaign::Event.list(domain, campaign_id)
    end

    def opens(domain = Mailgun.domain, campaign_id)
    	Mailgun::Campaign::Open.list(domain, campaign_id)
    end

    def stats(domain = Mailgun.domain, campaign_id)
      Mailgun::Campaign::Stat.list(domain, campaign_id)
    end

    def unsubscribes(domain = Mailgun.domain, campaign_id)
      Mailgun::Campaign::Unsubscribe.new(@mailgun, self).list(domain, campaign_id)
    end

    private

    # Helper method to generate the proper url for Mailgun campaign API calls
    def campaign_url(domain, campaign_id=nil)
      "#{@mailgun.base_url}/#{domain}/campaigns#{'/' + campaign_id if campaign_id}"
    end
    
	end
end