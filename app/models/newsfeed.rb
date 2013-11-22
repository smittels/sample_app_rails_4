class Newsfeed
#require 'rest_client'

  attr_accessor :id, :title, :summary

  def initialize
    #fetch from http
    #http://ec2-54-221-143-22.compute-1.amazonaws.com:4001/admin/content/doc?limit=4
    id = 1
    title = "This is an article"
    summary = "Yesterday after lunch, Brad Pitt had dinner."
    #parse and set attributes?? or just display
  end

end
