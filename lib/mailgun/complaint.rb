module Mailgun
  class Complaint
    # Used internally, called from Mailgun::Base
    def initialize(mailgun)
      @mailgun = mailgun
    end
    
    # List all complaints for a given domain
    # * domain the domain for which all complaints will listed
    def list(domain = Mailgun.domain)
      response = Mailgun.submit :get, complaint_url(domain)

      if response
        response["items"].collect {|item| Mailgun::Item.new(item) }
      end
    end
    
    # Find a complaint email for a domain
    def find(domain = Mailgun.domain, email)
      Mailgun.submit :get, complaint_url(domain, email)
    end

    # Add a email to the complaint list for a domain
    def add(domain=Mailgun.domain, email)
      Mailgun.submit :post, complaint_url(domain), {:address => email}
    end

    # Remove an email from the complaint list of a domain
    def remove(domain = Mailgun.domain, email)
      Mailgun.submit :delete, complaint_url(domain, email)
    end

    private

    # Helper method to generate the proper url for Mailgun complaints API calls
    def complaint_url(domain, address=nil)
      "#{@mailgun.base_url}/#{domain}/complaints#{'/' + address if address}"
    end
    
  end
end