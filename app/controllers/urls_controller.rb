class UrlsController < ApplicationController
  def create
    @new_url = Url.shorten(params[:url])
    unless @new_url.save
     flash[:error] = @new_url.errors.full_messages
    end
    redirect_to root_path
  end

  def destroy
    Url.find(params[:id]).destroy
    redirect_to root_path
  end

  def show
    url = Url.find_by_shortened_url(params[:id])
    url.update_attributes(:clicks => url[:clicks] +1 )
    redirect_to "#{url.original_url}"
  end
end
