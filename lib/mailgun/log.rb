module Mailgun
	class Log
    # Used internally, called from Mailgun::Base
    def initialize(mailgun)
      @mailgun = mailgun
    end
    
    # List all emails sent for a given domain
    # * domain the domain for which all emails will listed
    def list(domain=Mailgun.domain, limit=100, skip=0)
      response = get_log(domain, limit, skip)

      if response
        response["items"].collect {|item| item["message"]}
      end
    end

    # List all failed mailing attempts for a given domain
    def failed(domain=Mailgun.domain, limit=100, skip=0)
      response = get_log(domain, limit, skip)
      
      if response
        response["items"].collect {|item| item["message"] if item["hap"] == "failed"}.compact!
      end
    end

    # List all delivered mail for a given domain
    def delivered(domain=Mailgun.domain, limit=100, skip=0)
      response = get_log(domain, limit, skip)

      if response
        response["items"].collect {|item| item["message"] if item["hap"] == "delivered"}.compact!
      end
    end

    private

    # Helper method to get logs for each log call
    def get_log(domain, limit, skip)
      Mailgun.submit :get, log_url(domain), {:limit => limit, :skip => skip}
    end

    # Helper method to generate the proper url for Mailgun log API calls
    def log_url(domain)
      "#{@mailgun.base_url}/#{domain}/log"
    end
   
	end
end