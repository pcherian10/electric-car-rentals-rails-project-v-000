class BookingsController < ApplicationController
  def new
    @booking = Booking.create(:start_date, :end_date,
      :user_id => params[:user_id],
      :attraction_id => params[:attraction_id]
    )
    redirect_to user_path(@booking.user)
  end

end


=begin

class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_ids => [], :categories_attributes => [:name])
  end

end
=end
