class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published?

    #resheduling tweet to future
    return if tweet.publish_at > Time.current
    
    tweet.publish_to_twitter!
  end
end
