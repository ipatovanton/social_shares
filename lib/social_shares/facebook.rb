module SocialShares
  class Facebook < Base
    def shares!
      response = RestClient.get(url)
      JSON.parse(response)["shares"] || 0
    end

  private

    def url
      "http://graph.facebook.com/?id=#{checked_url}"
    end
  end
end
