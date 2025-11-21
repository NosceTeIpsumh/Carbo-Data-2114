class SearchController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:query].present?
      @results = PgSearch.multisearch(params[:query])
                         .includes(:searchable)
    else
      @results = []
    end
  end
end
