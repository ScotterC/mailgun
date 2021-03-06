module Mailgun
  class Unsubscribe
    # Used internally, called from Mailgun::Base
    def initialize(mailgun)
      @mailgun = mailgun
    end
    
    # List all unsubscribes for a given domain
    # * domain the domain for which all unsubscribes will listed
    def list(domain = Mailgun.domain)
      response = Mailgun.submit :get, unsubscribe_url(domain)

      if response
        response["items"].collect {|item| Mailgun::Item.new(item) }
      end
    end

    # Find a particular unsubscribe for a given domain
    def find(domain = Mailgun.domain, email)
      Mailgun.submit :get, unsubscribe_url(domain, email)
    end

    # Add an unsubscribe for a given domain
    def add(email, domain=Mailgun.domain, tag='*')
      Mailgun.submit :post, unsubscribe_url(domain), {:address => email, :tag => tag}
    end

    # Remove an unsubscribe for a given domain
    def remove(domain = Mailgun.domain, email)
      Mailgun.submit :delete, unsubscribe_url(domain, email)
    end
    
    private

    # Helper method to generate the proper url for Mailgun unsubscribe API calls
    def unsubscribe_url(domain, address=nil)
      "#{@mailgun.base_url}/#{domain}/unsubscribes#{'/' + address if address}"
    end
    
  end
end