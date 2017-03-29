module SocialShares
  class Facebook < Base
    URL = 'http://graph.facebook.com/v2.7/'

    def shares!
      response = get(URL, params: {
        id: checked_url,
        access_token: facebook_token,
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
  end
end
