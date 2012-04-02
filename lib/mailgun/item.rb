module Mailgun
	class Item	
		def initialize(data)
			@data = data
		end

	  private
	  
	  # So we can call item.adderss instead of item['ddress']
	  def method_missing(name)
	    @data[name.to_s]
	  end
	end
end