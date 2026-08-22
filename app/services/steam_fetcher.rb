require "faraday"
require "json"

class SteamFetcher
    URL = "https://store.steampowered.com/api/featuredcategories/"

    def self.fetch_specials
        response = Faraday.get(URL, { cc: "kr", l: "korean" })
        data = JSON.parse(response.body)

        specials = data.dig("specials", "items") || []

        specials.each do |item|
            Game.find_or_create_by(steam_appid: item["id"]) do |game|
                game.name = item["name"]
                game.original_price = (item["original_price"].to_i / 100.0).round
                game.final_price = (item["final_price"].to_i / 100.0).round
                game.discount_percent = item["discount_percent"]
                game.header_image = item["header_image"]
            end
        end
    end
end
