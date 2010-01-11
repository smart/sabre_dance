class Post < ActiveRecord::Base

  def self.update_posts
    update_news
    update_tweets
  end

  def self.update_news
    feed = Feedzirra::Feed.fetch_and_parse("http://www.discobiscuits.com/bin/rss.xml")
    feed.entries.each do |entry|
      Post.find_or_create_by_title_and_published(:title => entry.title, :published => entry.published, :summary => entry.summary, :url => entry.url, :post_type => "Offical News")
    end
  end

  def self.update_tweets
    feed = Feedzirra::Feed.fetch_and_parse("http://twitter.com/statuses/user_timeline/17971768.rss")
    feed.entries.each do |entry|
      Post.find_or_create_by_title_and_published(:title => entry.title, :published => entry.published, :summary => entry.summary, :url => entry.url, :post_type => "Tweet")
    end
  end
end
