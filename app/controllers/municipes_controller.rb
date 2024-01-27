class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[show edit update toggle_status]

  def index
    @q = Municipe.ransack(params[:q])
    @q.sorts = 'full_name asc' if @q.sorts.empty?
    @municipes = @q.result.includes(:address)
  end

  def show; end

  def new
    @municipe = Municipe.new
    @municipe.build_address
  end

  def create
    @municipe = Municipe.new(municipe_params)

    if @municipe.save
      Notification::MessageDeliverer.call(@municipe, :create)
      redirect_to @municipe, notice: t('.create')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @municipe.update(municipe_params)
      Notification::MessageDeliverer.call(@municipe, :update)
      redirect_to @municipe, notice: t('.update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def toggle_status
    update_status!

    if @municipe.save
      Notification::MessageDeliverer.call(@municipe, :toggle_status)
      redirect_to root_path, notice: t('.toggle_status.success')
    else
      redirect_to municipe_path(@municipe), status: :unprocessable_entity, notice: t('.toggle_status.failure')
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

  def update_status!
    @municipe.status = @municipe.status == 'active' ? 'inactive' : 'active'
  end
end
