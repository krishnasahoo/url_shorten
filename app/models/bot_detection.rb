class BotDetection
  def self.bot?(agent)
   matches = nil
   matches = agent.match(/(facebook|postrank|voyager|twitterbot|googlebot|slurp|butterfly|pycurl|tweetmemebot|metauri|evrinid|reddit|digg|sitebot|msnbot|robot|bot|twurly|crawl|file|mailto|epicbot|veoozbot|leikibot|linkisbot|datagnionbot|golabbot|curios george|gnowitnewsbot|fyrebot|pinterest|experibot_v1|experibot|bingbot|cloudflare-amp|semanticbot|anderspinkbot|primalbot|seznambot|epicbot|mediatoolkitbot|org_bot)/mi) if agent

   return (agent.nil? || matches)

  end
end
