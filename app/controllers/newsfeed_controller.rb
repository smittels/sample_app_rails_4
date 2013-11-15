class NewsfeedController < ApplicationController
  #before_action :signed_in_user, only: [:create, :destroy]
  #before_action :correct_user,   only: :destroy

  def create
    #@newsfeed = current_user.newsfeed.initiate
    @newsfeed = Newsfeed.new(params[:id])
    render

    #if @newsfeed.save
    #  flash[:success] = "Newsfeed created!"
    #  redirect_to root_url
    #else
    #  @feed_items = []
    #  render 'static_pages/home'
    #end
  end
  
  def destroy
    @newsfeed.destroy
    redirect_to root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
  
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
