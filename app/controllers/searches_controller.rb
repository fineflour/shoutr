class SearchesController < ApplicationController
  def show
    @search = Search.new(term: search_term)
  end

  private
  def search_term
    params[:search][:term]
  end
end
