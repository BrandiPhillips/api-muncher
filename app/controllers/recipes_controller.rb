require "#{Rails.root}/lib/edemam_api_wrapper.rb"
require "#{Rails.root}/lib/recipe.rb"
require 'kaminari'


class RecipesController < ApplicationController
  # will show the list of search results
  def index
    @search_term = params[:search_term]
    @search_results = EdemamApiWrapper.list_recipes(params[:search_term])
    if params[:page] != nil
      @search_results = Kaminari.paginate_array(@search_results).page(params[:page]).per(15)
    else
      @search_results = Kaminari.paginate_array(@search_results).page(0).per(15)
    end
  end

  def show
    # show a single recipe
    @recipe = EdemamApiWrapper.get_a_recipe(params[:uri])

  end

end
