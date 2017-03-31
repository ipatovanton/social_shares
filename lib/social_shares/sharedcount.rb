module SocialShares
  class Sharedcount < Base
    def shares!
      response = RestClient.get(url)
      JSON.parse(response)["shares"] || 0
    end

  private

    def url
      "https://free.sharedcount.com/?url=#{checked_url}&apikey=#{socialshared_api_key}"
    end
  end
end
