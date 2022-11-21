class BirdsController < ApplicationController
  
  wrap_parameters format: []

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    # 500 - Internal Server Error
    # ActiveModel::ForbiddenAttributesError 
    # bird = Bird.create(params)

    # the below works ==> this will return a new hash with only the name and species keys
    # bird = Bird.create(params.permit(:name, :species))
    # using the method of  the private
    bird = Bird.create(bird_params)
    render json: bird, status: :created
    # bird = Bird.create(name: params[:name], species: params[:species])
    # render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  private
  # all methods below here are private

  def bird_params
    params.permit(:name, :species)
  end

end
