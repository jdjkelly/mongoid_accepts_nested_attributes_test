class BandsController < ApplicationController

  def update
    @band = Band.find(params[:id])

    @band.update_attributes(params_for_update)

    render nothing: true
  end

  def params_for_update
    params.require(:band).permit(:instruments_attributes => [ :id, :name ])
  end
end
