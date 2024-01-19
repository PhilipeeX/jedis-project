class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[show edit update]

  def index
    @municipes = Municipe.all
  end

  def show; end

  def new
    @municipe = Municipe.new
  end

  def create
    @municipe = Municipe.new(municipe_params)

    if @municipe.save
      redirect_to @municipe, notice: 'Cidadão criado com sucesso.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @municipe.update(municipe_params)
      redirect_to @municipe, notice: 'Cidadão atualizado com sucesso.'
    else
      render :edit
    end
  end

  private

  def set_municipe
    @municipe = Municipe.find(params[:id])
  end

  def municipe_params
    params.require(:municipe).permit(:full_name, :cpf, :cns, :email, :birth_date, :phone_number, :status)
  end
end
