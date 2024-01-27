require 'rails_helper'

RSpec.describe MunicipesController, type: :controller do
  let!(:municipe) { create(:municipe) }

  describe 'GET #index' do
    let!(:active_municipe) { create(:municipe, status: :active) }
    let!(:inactive_municipe) { create(:municipe, status: :inactive) }

    context 'without search parameters' do
      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end

      it 'assigns all municipes to @municipes' do
        get :index
        expect(assigns(:municipes)).to match_array([municipe, active_municipe, inactive_municipe])
      end
    end

    context 'with search parameters' do
      let(:name) { active_municipe.full_name }
      it 'renders the index template' do
        get :index,
            params:
              { q:
                  { full_name_or_cpf_or_cns_or_email_or_phone_number_or_address_state_or_address_city_cont: name } }
        expect(response).to render_template(:index)
      end

      it 'assigns filtered municipes to @municipes' do
        get :index,
            params:
              { q:
                  { full_name_or_cpf_or_cns_or_email_or_phone_number_or_address_state_or_address_city_cont: name } }
        expect(assigns(:municipes)).to eq([active_municipe])
      end
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:valid_cep) { '69076-710' }
    let(:invalid_cep) { '65078-720' }
    it 'redirects to the show page on success' do
      post :create, params: { municipe: attributes_for(:municipe) }
      expect(response).to redirect_to(assigns(:municipe))
    end

    it 'creates a new municipe' do
      expect do
        post :create, params: { municipe: attributes_for(:municipe) }
      end.to change(Municipe, :count).by(1)
    end

    it 'dont creates a new municipe with invalid municipe params' do
      expect do
        post :create, params: { municipe: attributes_for(:municipe, cpf: '102.785.90056') }
      end.to change(Municipe, :count).by(0)
    end

    it 'Creates a new municipe with valid address params' do
      expect do
        post :create, params: { municipe: attributes_for(:municipe).merge(address_attributes: { cep: valid_cep,
                                                                                                street: 'Rua 2',
                                                                                                neighborhood: 'Centro',
                                                                                                city: 'Niterói',
                                                                                                state: 'RJ' }) }
      end.to change(Municipe, :count).by(1)
    end

    it 'dont creates a new municipe with invalid address params' do
      expect do
        post :create, params: { municipe: attributes_for(:municipe).merge(address_attributes: { cep: invalid_cep,
                                                                                                street: 'Rua 2',
                                                                                                neighborhood: 'Centro',
                                                                                                city: 'Niterói',
                                                                                                state: 'RJ' }) }
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

  describe 'PATCH #toggle_status' do
    let(:municipe) { create(:municipe, status: 'active') }

    it 'toggles the status successfully' do
      patch :toggle_status, params: { id: municipe.id }

      municipe.reload
      expect(municipe.status).to eq('inactive')
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq(I18n.t('municipes.toggle_status.success'))
    end
  end
end
