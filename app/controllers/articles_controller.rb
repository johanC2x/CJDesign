class ArticlesController < ApplicationController

	before_action :set_article, only: [:show, :edit, :update, :destroy, :publish]

	def index  
		@articles = Article.where("user_id = ?",current_user.id).ordenados
	end  

	# Show Article
	def show 
		@comment = Comment.new
	end  
 
	# Create Article  
	def new  
		@article = Article.new
	end 
  
	#create Article 
	def create 
		@article = current_user.articles.new(article_params)
		@article.publish = 1
		respond_to do |format|
			if @article.save 
				format.html {redirect_to action: :index, notice: 'Articulo creado' }
			else  
				format.html {redirect_to action: :index, notice: 'Ocurrio un Error' }
			end
		end 
	end

	def edit 
	end

	# Update Article
	def update 
	end 
	# Delete Article
	def destroy 
	end 

	def publish  
		if @article.publish == 0 
			Article.update(@article.id, :publish => 1)
			respond_to do |format|
				if @article.save
					puts "Publicado"
					format.html {redirect_to action: :index, notice: 'Publicado' }
				else
					puts "No Publicado"
					format.html {redirect_to action: :index, notice: 'Ocurrio un Error' }
				end
			end 
		else
			if @article.publish == 1
				Article.update(@article.id, :publish => 0)
				respond_to do |format|
					if @article.save
						puts "Publicado"
						format.html {redirect_to action: :index, notice: 'Publicado' }
					else
						puts "No Publicado"
						format.html {redirect_to action: :index, notice: 'Ocurrio un Error' }
					end
				end 
			end
		end 
	end 

	private  
	def set_article
      @article = Article.find(params[:id])
    end

	def article_params
		params.require(:article).permit(:titles,:description,:cover,:publish)
	end

end
