class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to article_path(@article), notice: 'Comment was successfully created.' }
        # format.js
      end
    end
  end
 
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    respond_to do |format|
      if @comment.destroy
        # format.html { redirect_to article_path(@article), notice: 'Comment was successfully deleted.' }
        format.js
      end
    end
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
