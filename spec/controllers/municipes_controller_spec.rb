require 'rails_helper'

RSpec.describe MunicipesController, type: :controller do
  let!(:municipe) { create(:municipe) }

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns all municipes to @municipes' do
      get :index
      expect(assigns(:municipes)).to eq([municipe])
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'redirects to the show page on success' do
      post :create, params: { municipe: attributes_for(:municipe) }
      expect(response).to redirect_to(assigns(:municipe))
    end

    it 'creates a new municipe' do
      expect do
        post :create, params: { municipe: attributes_for(:municipe) }
      end.to change(Municipe, :count).by(1)
    end

    it 'dont creates a new municipe with invalid params' do
      expect do
        post :create, params: { municipe: attributes_for(:municipe, cpf: '102.785.90056') }
      end.to change(Municipe, :count).by(0)
    end
  end

  describe 'GET #edit' do
    it 'renders the edit template' do
      get :edit, params: { id: municipe.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    it 'redirects to the show page on success' do
      put :update, params: { id: municipe.id, municipe: attributes_for(:municipe) }
      expect(response).to redirect_to(assigns(:municipe))
    end

    it 'updates the municipe with valid name' do
      put :update, params: { id: municipe.id, municipe: attributes_for(:municipe, full_name: 'Philipe Rodrigues') }
      municipe.reload
      expect(response).to redirect_to(municipe)
      expect(flash[:notice]).to eq(I18n.t('municipes.update'))
    end

    it 'does not update the municipe with invalid params' do
      put :update, params: { id: municipe.id, municipe: attributes_for(:municipe, email: 'Dev.@Philipe@outlook.com') }
      municipe.reload

      expect(response).to render_template(:edit)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: municipe.id }
      expect(response).to render_template(:show)
    end
  end
end
