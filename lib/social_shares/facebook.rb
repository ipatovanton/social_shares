module SocialShares
  class Facebook < Base
    URL = 'http://graph.facebook.com/'

    def shares!
      response = get(URL, params: {
        access_token: ENV["facebook_token"],
        id: checked_url,
        fields: 'share'
      })
      json_response = JSON.parse(response)

      if json_response['share']
        json_response['share']['share_count'] || 0
      else
        0
      end
    end
  end
end
