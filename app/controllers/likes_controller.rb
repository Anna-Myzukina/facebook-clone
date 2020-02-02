class LikesController < ApplicationController
    before_action: locate_post

     def create
        @post.like.create(user_id:current_user.id)
        redirect_to post_path(@post)
     end


    private
    def locate_post
        @post = Post.find(params[:post_id])
    end
end
