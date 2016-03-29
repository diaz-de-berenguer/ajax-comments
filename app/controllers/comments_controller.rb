class CommentsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.build(comment_params)
		@comment.save
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@article = @comment.article
		@comment.destroy
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end

end
