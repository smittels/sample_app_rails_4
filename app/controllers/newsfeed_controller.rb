require 'uri' 

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

    # You should use host ec2-54-197-232-114.compute-1.amazonaws.com 
    # (or IP address 54.197.232.114). This is an Elastic IP so will not change. 

    # There are two services and each service is listening on two ports, 
    # one HTTP and one HTTPS. The HTTP ports are IP restricted 
    # while the HTTPS ports are not.

    # The content service is listening on 4001 (HTTP) and 4002 (HTTPS)
    # The profile service is listening on 4003 (HTTP) and 4004 (HTTPS)

    # You should use the HTTPS port if you can because that's not IP restricted
    # but currently we're using a self-signed certificate. 
    # We're in the process of getting a "real" cert. 

    if params[:dlrid] 
      dlrid=params[:dlrid]
    else
      dlrid=1
    end

    
    @dlr= DocumentListRequest.find(dlrid)
    attrs = @dlr.attributes
    query_attrs1 = attrs.except("id")
    query_attrs2 = query_attrs1.except("created_at")
    query_attrs = query_attrs2.except("updated_at")
    query_str=query_attrs.to_query
    
    url = "https://54.197.232.114:4002/admin/content/doc?#{query_str}"
    @theurl=url

    response = RestClient::Resource.new(url, 'OkDJYTKTxeNO5SAbykpC', 'xPiCCVq#JKPLqcFILHgOXBU7Y#IrXVw2O3C%8Y^K')

    @newsdata = response.get

    url="https://54.197.232.114:4004/admin/profile/#{dlrid}/celebrityRating"

    response = RestClient::Resource.new(url, 'OkDJYTKTxeNO5SAbykpC', 'xPiCCVq#JKPLqcFILHgOXBU7Y#IrXVw2O3C%8Y^K')
    @celebrityRating = response.get


    #response = RestClient::Resource.new('https://54.197.232.114:4004/admin/profile', 'OkDJYTKTxeNO5SAbykpC', 'xPiCCVq#JKPLqcFILHgOXBU7Y#IrXVw2O3C%8Y^K')

    #@profiles = response.get
    

    render 'newsfeed/_newsfeed'

  end

  def hello
    @hello="original text"
  end

  def update
    @hello = "replacement text"
    render :partial => "update_h"
  end

  def rateCelebrity
    profileAPI = RestClient::Resource.new('https://54.197.232.114:4004/admin/', 'OkDJYTKTxeNO5SAbykpC', 'xPiCCVq#JKPLqcFILHgOXBU7Y#IrXVw2O3C%8Y^K')
    string = 'profile/1/celebrityRating/'+params[:thecelebrity]
    @ret = profileAPI[string].put({'rating' => params[:therank]}.to_json, :content_type => 'application/json')
    #@ret = profileAPI['profile/1'].put({'rating' => params[:therank]}.to_json, 'celebrityRating' => params[:thecelebrity], :content_type => 'application/json')
    #@ret = profileAPI['profile/1/celebrityRating/4633'].put({'rating' => params[:therank]}.to_json, :content_type => 'application/json')

    #render :partial => "_update_rank1", "locals" => {:therank => params[:therank], :thearticle => params[:thearticle], :thecelebrity => params[:thecelebrity]}

    redirect_to (:back)
    #render(:update) { |page| page.reload }
     
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
