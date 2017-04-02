module SocialShares
  class Sharedcount < Base
    def shares!
      response = RestClient.get(url)
      data = JSON.parse(response)
      data.dig('Facebook', 'share_count').to_i
    end

  private

    def url
      "https://free.sharedcount.com/?url=#{checked_url}&apikey=#{Rails.application.secrets.socialshared_api_key}"
    end
  end
end
