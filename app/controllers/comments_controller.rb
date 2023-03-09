class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # .create method will create *and* save, apparently (no "new" 1st here?)
    @comment = @post.comments.create(comment_params)

    redirect_to post_path(@post)
  end

  def destroy
    # Don't forget, if you're not sure how something's gonna work, you can log!
    puts "\n"
    puts "params\n"
    puts params
    puts "\n"
    # Turns out that params[:id] is the comment ID.
    # Comments have unique IDs, so we can probably delete like this:
    Comment.destroy(params[:id])
    redirect_to post_path(params[:post_id]), status: :see_other

    # Above is my solution, whereas guide does this:
    # Find the post then find the comment:
    # @post = Post.find(params[:post_id])
    # @comment = @post.comments.find(params[:id])
    # @comment.destroy
    # redirect_to post_path(@post), status: :see_other

    # Two sides of the same coin IMHO
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
