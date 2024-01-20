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

    fill_in('municipe[full_name]', with: 'Rick Spohr')
    click_button I18n.t('municipes.form.save')

    expect(page).to have_text('Rick Spohr')
  end

  scenario 'show municipe' do
    visit municipes_path(Municipe.first)

    expect(page).to have_text('João Victor')
  end

  scenario 'update municipe' do
    visit municipes_path
    first('table tbody tr').click_link(I18n.t('municipes.municipe.edit'))

    fill_in 'municipe[full_name]', with: 'Lucas Borges'
    click_button I18n.t('municipes.form.save')

    expect(page).to have_text('Lucas Borges')
  end
end
