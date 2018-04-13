class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    condition = @cocktail.save
    if condition
      redirect_to cocktails_path
    else
      render :new
    end

  end

  def edit

  end

  def update
    respond_to do |format|
      if @cocktail.update(cocktails_params)
        format.html { redirect_to @cocktail, notice: 'cocktail was successfully updated.' }
        format.json { render :show, status: :ok, location: @cocktail }
      else
        format.html { render :edit }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
   @cocktail.destroy
   redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])

  end

  def cocktails_params
    params.require(:cocktail).permit(:name)
  end
end
