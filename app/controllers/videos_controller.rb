class VideosController < ApplicationController
  skip_before_action :authenticate_request, only: %i[index show]
  
  def create
    logger.debug "data user #{@current_user.attributes.inspect}"
    uploaded_io = params[:file]
    video_path = 'uploads/videos'
    File.open(Rails.root.join('public', video_path, uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @video = Video.new(video_params)
    @video.url_path = "#{video_path}/#{uploaded_io.original_filename}"
    if @video.save
      render json: {
        message: 'Video upload successfully',
        code: 'success'
      }
    else
      render json: {
        message: 'Video failed to upload',
        code: 'error'
      }
    end
  end

  def show
  end

  def index
    @videos = Video.all
    @url_base = "#{request.protocol}#{request.env['HTTP_HOST']}"
  end

  def my_video
    #logger.log params[:user_id]
    @videos = Video.video_find_by_user_id(params[:user_id])
    @url_base = "#{request.protocol}#{request.env['HTTP_HOST']}"
  end
  
  private
  
  def video_params
    params.permit(:title, :user_id)
  end

end
