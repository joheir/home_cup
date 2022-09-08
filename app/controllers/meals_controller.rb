class MealsController < ApplicationController
  before_action :set_profile, except: %i[destroy_all]
  before_action :set_chat

  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @meal = Meal.new
    @meal.account = current_account
    @meal.picture_url = params[:picture_url]
    @meal.url = params[:url]
    @meal.name = params[:name]
    if @meal.save
      flash[:notice] = "Meal is successfully added"
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to search_profile_meals_path(@profile, query: params[:query])
  end

  def search
    @profile = Profile.find(params[:profile_id])
    ingredient = params[:query]

    url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"

    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)
    recipes = []
    html_doc.search(".standard-card-new__article-title").first(10).each do |element|
      uri = element.attribute("href").value
      recipes << "https://www.bbcgoodfood.com#{uri}"
    end
    @processed_recipes = []
    recipes.map do |link|
      @processed_recipes << scraper(link)
    end
  end

  def scraper(url)
    doc = Nokogiri::HTML(URI.open(url, 'Accept-Language' => 'en-US').read)
    name = doc.search('h1').text.strip
    picture_url = doc.search('.post-header__image-container .image__img').attribute("src").value
    { name: name, picture_url: picture_url, url: url }
  end


  def destroy_all
    @meals = Meal.all
    @meals.destroy_all
    redirect_to profile_meals_path(session[:current_profile_id])
  end

  def vote
    @profile = Profile.find(params[:profile_id])
    @meal = Meal.find(params[:id])
    if @profile.voted_for? @meal
      @meal.unliked_by @profile
    else
      @meal.liked_by @profile
    end
    # render 'like', formats: :js
    redirect_to profile_meals_path
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end


  def set_chat
    @chats = Chat.where(receiver_chat: @profile)
  end

  def meal_params
    params.require(:meal).permit(:name, :url, :picture_url)
  end
end
