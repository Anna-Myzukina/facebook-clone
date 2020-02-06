class CommentsController < ApplicationController
    def new
      @comment = Comment.new
    end
    
    def create
        @comment = Comment.new(comment_params)
       @comment.post_id =params[:post_id]
       @comment.save
       redirect_to (@comment.post)
    end

    def destroy
        @post = Post.find(params[:id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    private
    def comment_params
        params.require(:comment).permit(:username, :body)
    end
end
