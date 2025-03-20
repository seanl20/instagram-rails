class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    puts "params.inspect"
    puts params.inspect
    puts "params.inspect"
    @post = Posts::Commands::Create.new.call(params: post_params, user: current_user)

    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:photo)
  end
end
