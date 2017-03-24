module SocialShares
  class Facebook < Base
    def shares!
      response = RestClient.get(url, params: {
        field: 'share'
        })
        json_response = JSON.parse(response)

      if json_response['share']
        json_response['share']['share_count'] || 0
      else
        0
      end
    end
    
    private

    def url
      "https://graph.facebook.com/v2.8/#{checked_url}?#{ENV["facebook_token"]}"
    end
  end
end
