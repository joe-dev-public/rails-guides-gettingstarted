class PostsController < ApplicationController
  # Ruby basics: public method(s)
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    # @comments = @post.comments
  end

  # Instantiate, but don't save
  # (Thus also don't validate)
  # (Renders "new" view by default)
  def new
    @post = Post.new
  end

  # Instantiate with values & attempt to save
  # (Thus do validate)
  def create
    @post = Post.new(post_params)

    if @post.save
      # Successful save redirectrs
      redirect_to @post
    else
      # Unsuccessful save renders "new" view with status 422
      # (Presumably look up render method for details)
      render :new, status: :unprocessable_entity
    end
  end

  # Guessing this one without reading the guide beyond the method name ;¬)
  def edit
    @post = Post.find(params[:id])
  end

  # Likewise
  def update
    # OK, had to read guide for this: note the difference vs create
    # First find the post
    @post = Post.find(params[:id])

    # Then update:
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # We can either find then destroy (guide approach):
    # @post = Post.find(params[:id])
    # @post.destroy

    # Or just destroy it one go:
    Post.destroy(params[:id])

    # https://api.rubyonrails.org/v7.0.4.2/classes/ActionController/Redirecting.html#method-i-redirect_to
    redirect_to action: 'index', status: :see_other
    # This doesn't work, fair enough? :¬P
    # redirect_to :index, status: :see_other
  end

  # Ruby basics: private method
  private

  # "Strong" parameters: specify what values are allowed in the hash
  # passed to Post.new
  def post_params
    params.require(:post).permit(:title, :body, :status)
  end
end
