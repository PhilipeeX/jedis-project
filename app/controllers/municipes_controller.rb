class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[show edit update]

  def index
    @municipes = Municipe.all
  end

  def show; end

  def new
    @municipe = Municipe.new
    @municipe.build_address
  end

  def create
    @municipe = Municipe.new(municipe_params)

    if @municipe.save
      redirect_to @municipe, notice: t('.create')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @municipe.update(municipe_params)
      redirect_to @municipe, notice: t('.update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_municipe
    @municipe = Municipe.find(params[:id])
  end

  def municipe_params
    params.require(:municipe).permit(:full_name, :cpf, :cns, :email, :email_confirmation, :birth_date, :phone_number,
                                     :photo, :status,
                                     address_attributes: %i[cep street complement neighborhood city state ibge_code])
  end
end
