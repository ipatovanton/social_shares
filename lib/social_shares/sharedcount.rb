module SocialShares
  class Sharedcount < Base
    def shares!
      response = RestClient.get(url)
      
      data = JSON.parse(response)
      
      data['Facebook'].is_a?(Hash) && data['Facebook']["share_count"] || 0
    end

  private

    def url
      "https://free.sharedcount.com/?url=#{checked_url}&apikey=#{Rails.application.credentials.socialshared_api_key}"
    end
    end
  end
end
