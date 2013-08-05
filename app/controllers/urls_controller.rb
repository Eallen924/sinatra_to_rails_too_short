class UrlsController < ApplicationController
  def create
    @new_url = Url.shorten(params)
    if @new_url.save
    else
      @errors = @new_url.errors.full_messages
      @urls = Url.all
    end
    render 'index/index'
  end

  def destroy
    Url.find(params[:id]).destroy
    render 'index/index'
  end

  def show
    url = Url.find_by_shortened_url(params[:short_url])
    url.update_attributes(:clicks => @url[:clicks] +1 )
    redirect_to "#{url.original_url}"
  end
end
