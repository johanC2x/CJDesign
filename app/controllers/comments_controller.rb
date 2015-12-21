class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_article  
  respond_to :html

  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end 
 
  def new
    @comment = Comment.new
    respond_with(@comment)
  end
 
  def edit 
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.article = @article

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.article , notice: 'Comentario agregado' }
        format.json { render :show, status: :created, location: @comment.article }
        #respond_with(@comment.article)
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end 

  end

  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  private

    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:user_id, :article_id, :body)
    end
end
