class DirectoriesController < ApplicationController
  before_action :find_root_directory, only: [:index]
  before_action :find_directory, only: [:show]

  def index
  end

  def create
    directory = Directory.create(directory_params)
  end

  def show
    render json: @directory.tree.to_json
  end

  private

  def directory_params
    params.require(:directory).permit(:directory_id) || {}
  end

  def find_root_directory
    @root = Directory.find_by(directory_id: nil)
  end

  def find_directory
    @directory = Directory.find(params[:id])
  end

end
