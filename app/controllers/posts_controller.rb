class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Posts::Commands::Create.new.call(params: post_params, user: current_user)

    redirect_to edit_post_path(@post)
  end

  def edit
    @post = Posts::Queries::Get.new.call(id: params[:id])

    render @post.status
  end

  def update
    @post = Posts::Commands::Update.new.call(id: params[:id], params: post_params)
    puts "@post"
    puts @post.inspect
    puts "@post"
    if @post.published?
      redirect_to root_path
    else
      redirect_to edit_post_path(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :photo,
      :x_offset,
      :y_offset,
      :width,
      :height,
      :status,
      :filter_name,
      :description
    )
  end
end
