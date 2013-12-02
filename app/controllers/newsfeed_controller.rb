
class NewsfeedController < ApplicationController
  #before_action :signed_in_user, only: [:create, :destroy]
  #before_action :correct_user,   only: :destroy

 #def newsfeed
 # 
 #   @newsfeed = Newsfeed.new(params[:id])
 #   render
 # end

  def create
    @newsfeed = Newsfeed.new()
    #if defined? @newsfeed.title
    #  flash[:success] = "It has a title"
    #else 
    #  flash[:failure] = "It does NOT have a title"
    #end

    #@newsfeed = Newsfeed.new(params[:id])
    #@newsfeed = current_user.newsfeed.initiate


    #response = RestClient::Resource.new 'http://www.cnn.com/'
    #response = RestClient::Resource.new 'http://ec2-54-221-143-22.compute-1.amazonaws.com:4001/admin/content/doc?limit=4'
    #response = RestClient::Resource.new 'http://ec2-54-221-143-22.compute-1.amazonaws.com:4001/admin/content/doc'
    response = RestClient::Resource.new('https://ec2-54-221-143-22.compute-1.amazonaws.com:4002/admin/content/doc', 'OkDJYTKTxeNO5SAbykpC', 'xPiCCVq#JKPLqcFILHgOXBU7Y#IrXVw2O3C%8Y^K')
    var = response.get
    @cnnstr = var
    

    render 'newsfeed/_newsfeed'

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
