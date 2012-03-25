require 'ostruct'

module Yelp

  class Business
    
    def initialize(hash)
      @hash = hash
    end

    def id
      @hash['id']
    end

    def method_missing(method, *args, &block)
      @hash[method.to_s] || super
    end

    def location
      Yelp::Location.new(@hash['location'])
    end

    def ==(other)
      id == other.id
    end
      
      # Gets detailed business info from business API
      # Returns a Yelp Business object
    def fetch_details
      Yelp::Base.find_business(id)
    end

  end
  
end
