class HashtagsController < ApplicationController
  def show
    @hashtag = params[:id]
    @search = Search.new(term: hashtag)
  end
  private
  def hashtag
    "##{params[:id]}"
  end
end
