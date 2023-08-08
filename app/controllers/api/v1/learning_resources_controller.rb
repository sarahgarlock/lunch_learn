class Api::V1::LearningResourcesController < ApplicationController
  def index
    if params[:country].present?
      photo = PhotoFacade.new.search_photo(params[:country])
      video = VideoFacade.new.search_video(params[:country]).first
    end

    render json: LearningResource.new(params[:country], photo, video)
  end
end