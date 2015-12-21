class PageController < ApplicationController
  before_action :authenticate_user!, except: [:home,:about,:faqs,:contact,:service]
  def home
    if user_signed_in?
      redirect_to articles_path
    end
  end

  def about

  end

  def faqs
  	@articles = Article.publish
  end

  def contact 
  end 

  def service
     @products = Product.where.not(cover_file_name:nil)
  end 

  def follower
     @user = User.all
  end

end
