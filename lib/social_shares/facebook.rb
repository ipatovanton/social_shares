module SocialShares
  class Facebook < Base
    def shares!
      response = RestClient.get(url)
      JSON.parse(response)['share']['share_count'] || 0
    end
    
    private

    def url
      "https://graph.facebook.com/v2.8/#{checked_url}?#{ENV["facebook_token"]}"
    end
  end
end
