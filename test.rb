require 'thor'
require 'twitter'
require 'httparty'

TWITTER_APP_KEY="rzlJXhI8..."
TWITTER_APP_SECRET="euF5bItp9w..."
TWITTER_ACCESS_TOKEN="17827..."
TWITTER_ACCESS_TOKEN_SECRET="7NSX..."

def print_user_info( u )
  t = "%-20s: %s\n"
  printf t, "Screenname", u.user_name
  printf t, "Full Name", u.name
  printf t, "Bio", u.description
  printf t, "Website", u.website.to_s
  printf t, "Joined", u.created_at.strftime( "%Y-%m-%d" )
  printf t, "Location", u.location
  printf t, "Verified", u.verified?
  printf t, "Tweets", u.tweets_count
  printf t, "Followers", u.followers_count
  printf t, "Following", u.friends_count
  printf t, "Favorites count", u.favorites_count
end

class CLI < Thor
  desc "user SCREENAME", "Look up info for a specific user."
  def user( username )
    print_user_info client.user( "wschenk" )
  end

# We will add more methods here

  private
  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = TWITTER_APP_KEY
      config.consumer_secret     = TWITTER_APP_SECRET
      config.access_token        = TWITTER_ACCESS_TOKEN
      config.access_token_secret = TWITTER_ACCESS_TOKEN_SECRET
    end
  end
end

# Only run if the script is called directly
if __FILE__ == $0
  CLI.start( ARGV )
end

