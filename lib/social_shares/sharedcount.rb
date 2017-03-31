module SocialShares
  class Sharedcount < Base
    def shares!
      response = RestClient.get(url)
      json_response = JSON.parse(response)

      if json_response['Facebook']['share_count']
        json_response['Facebook']['share_count'] || 0
      else
        0
      end
    end

  private

    def url
      "https://free.sharedcount.com/?url=#{checked_url}&apikey=#{Rails.application.secrets.socialshared_api_key}"
    end
  end
end
