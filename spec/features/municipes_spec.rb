require 'rails_helper'

RSpec.feature 'Municipes', js: true, type: :feature do
  before do
    create(:municipe, full_name: 'João Victor')
    create(:municipe, full_name: 'Thais Veras')
  end

  scenario 'list municipes' do
    visit municipes_path

    expect(page).to have_text('João Victor')
    expect(page).to have_text('Thais Veras')
  end

  scenario 'create municipe' do
    visit new_municipe_path
    valid_cpf = '269.461.417-50'
    valid_email = FFaker::Internet.free_email

    # profile
    attach_file 'municipe_photo', 'spec/fixtures/images/profiles/perfil-masculino-2.jpg'
    fill_in('municipe[full_name]', with: 'Rick Spohr')
    fill_in('municipe[cpf]', with: valid_cpf)
    fill_in('municipe[cns]', with: '750620311660008')
    fill_in('municipe_email', with: valid_email)
    fill_in('municipe_email_confirmation', with: valid_email)
    fill_in('municipe_birth_date', with: '1996-09-27')
    fill_in('municipe_phone_number', with: '21966980366')

    # address
    fill_in('municipe_address_attributes_cep', with: '04036-100')
    fill_in('municipe_address_attributes_street', with: 'Rua Domingos de Morais')
    fill_in('municipe_address_attributes_neighborhood', with: 'Vila Mariana')
    fill_in('municipe_address_attributes_city', with: 'São Paulo')
    fill_in('municipe_address_attributes_state', with: 'SP')

    select(I18n.t('activerecord.attributes.municipe.status.active'), from: 'municipe_status')
    click_button I18n.t('municipes.form.save')

    expect(page).to have_text('Rick Spohr')
    expect(page).to have_text('269.461.417-50')
    expect(page).to have_text('750620311660008')
    expect(page).to have_text('27/09/1996')
    expect(page).to have_text('(21) 96698-0366')
  end

  scenario 'create municipe with generated CNS' do
    visit new_municipe_path
    valid_cpf = '269.461.417-50'
    valid_email = FFaker::Internet.free_email

    # profile
    attach_file 'municipe_photo', 'spec/fixtures/images/profiles/perfil-masculino-2.jpg'
    fill_in('municipe[full_name]', with: 'Rick Spohr')
    fill_in('municipe[cpf]', with: valid_cpf)
    click_button(I18n.t('municipes.form.generate_cns'))
    fill_in('municipe_email', with: valid_email)
    fill_in('municipe_email_confirmation', with: valid_email)
    fill_in('municipe_birth_date', with: '1996-09-27')
    fill_in('municipe_phone_number', with: '21966980366')

    # address
    fill_in('municipe_address_attributes_cep', with: '04036-100')
    fill_in('municipe_address_attributes_street', with: 'Rua Domingos de Morais')
    fill_in('municipe_address_attributes_neighborhood', with: 'Vila Mariana')
    fill_in('municipe_address_attributes_city', with: 'São Paulo')
    fill_in('municipe_address_attributes_state', with: 'SP')

    select(I18n.t('activerecord.attributes.municipe.status.active'), from: 'municipe_status')
    click_button I18n.t('municipes.form.save')

    expect(page).to have_text('Rick Spohr')
    expect(page).to have_text('269.461.417-50')
    expect(page).to have_text('27/09/1996')
    expect(page).to have_text('(21) 96698-0366')
    expect(page).to have_text('04036-100')
  end

  scenario 'show municipe' do
    visit municipes_path(Municipe.first)

    expect(page).to have_text('João Victor')
    expect(page).to have_text('Thais Veras')
  end

  scenario 'update municipe' do
    valid_cpf = '822.420.720-05'
    valid_email = FFaker::Internet.free_email
    visit municipes_path
    first('table tbody tr').click_link(I18n.t('municipes.municipe.edit'))

    fill_in 'municipe[full_name]', with: 'Lucas Borges'
    fill_in('municipe[cpf]', with: valid_cpf)
    fill_in('municipe[cns]', with: '838337659440018')
    fill_in('municipe_email', with: valid_email)
    fill_in('municipe_email_confirmation', with: valid_email)
    click_button I18n.t('municipes.form.save')

    expect(page).to have_text('Lucas Borges')
    expect(page).to have_text('822.420.720-05')
    expect(page).to have_text('838337659440018')
    expect(page).to have_text(valid_email)
  end

  scenario 'not update municipe with invalid email' do
    valid_cpf = '822.420.720-05'
    visit municipes_path
    first('table tbody tr').click_link(I18n.t('municipes.municipe.edit'))

    fill_in 'municipe[full_name]', with: 'Lucas Borges'
    fill_in('municipe[cpf]', with: valid_cpf)
    fill_in('municipe[cns]', with: '838337659440018')
    fill_in('municipe_email', with: 'marcos_dev@gmail..com')
    fill_in('municipe[email_confirmation]', with: 'marcos_dev@gmail..com')
    click_button I18n.t('municipes.form.save')

    expect(page).to have_text(I18n.t('errors.messages.invalid'))
  end
end
