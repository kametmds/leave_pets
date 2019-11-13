class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def edit
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to @pet, notice: 'ペット情報作成しました'
    else
      render :new
    end
  end

  def update
    if @pet.update(pet_params)
      redirect_to @pet, notice: 'ペット情報更新しました'
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_url, notice: 'ペット情報削除しました'
  end

  private
    def set_pet
      @pet = Pet.find(params[:id])
    end

    def pet_params
      params.require(:pet).permit %i(name age size weight content image image_cache)
    end
end
