class TweetsController < ApplicationController
  def search
    client = Twitter::REST::Client.new do |config|
      # applicationの設定
      config.consumer_key         = "fMTD5gs4Kr3l95WZtyZmaGkHo"
      config.consumer_secret      = "eXSnPp6rTKzVdVP57lOdP4vnrwOjTFRZq4xq3AtHfG6OY9JbQU"
      config.access_token         = "131071117-SND9LRMOqPdAjWonMvmOjPs2JG7CIRhQMzJvQsnC"
      config.access_token_secret  = "o8kMSUW0nja4mH97hKtFc6LNGeurNA8p5i8nTc2MKbZ7Z"
    end
    @tweets = []
    query = "ruby"
    since_id = nil
    if params[:keyword].present?
      tweets = client.search(params[:keyword], count: 10, result_type: "recent", exclude: "retweets", since_id: since_id)
      tweets.take(10).each do |tw|
        tweet = Tweet.new(tw.full_text)
        @tweets << tweet
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweets }
    end
  end
end
