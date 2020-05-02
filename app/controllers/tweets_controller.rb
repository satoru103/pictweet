class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet= Tweet.new
  end

  def create
    Tweet.create(tweet_params)
  end

  def destroy
  @tweet = Tweet.find(params[:id])
    if @tweet.destroy
      redirect_to root_path
    else
      render @tweet
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:name,:text,:image)
  end
end
