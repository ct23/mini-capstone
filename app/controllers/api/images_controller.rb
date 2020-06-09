class Api::ImagesController < ApplicationController

  def create
    @image = Image.new(
      url: params[:url],
      product_id: params[:product_id]
    )
    if @image.save
      render 'show.json.jb'
    else
      render json: { message: "There has been an error saving your image.",
                     error: @image.errors.full_messages }
    end
  end

end
