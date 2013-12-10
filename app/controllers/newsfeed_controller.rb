
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

    response = RestClient::Resource.new('https://ec2-54-221-143-22.compute-1.amazonaws.com:4002/admin/content/doc', 'OkDJYTKTxeNO5SAbykpC', 'xPiCCVq#JKPLqcFILHgOXBU7Y#IrXVw2O3C%8Y^K')
    var = response.get
    @newsdata = var
    

    render 'newsfeed/_newsfeed'

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
