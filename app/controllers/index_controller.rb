class IndexController < ApplicationController
  def show
    @url = Url.new
    @urls = Url.all
    render 'index/index'
  end

  
end
