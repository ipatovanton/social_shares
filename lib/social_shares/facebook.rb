module SocialShares
  class Facebook < Base
    def shares!
      response = RestClient.get(url, params: {
        fields: 'share'
      })
      json_response = JSON.parse(response)

      if json_response['share']
        json_response['share']['share_count'] || 0
      else
        0
      end
    end

  private

    
    def facebook_token
      ENV["facebook_token"]
    end
    def url
      "http://graph.facebook.com/?id=#{checked_url}?access_token=#{facebook_token}"
    end
  end
end
