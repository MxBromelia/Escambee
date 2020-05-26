require 'rails_helper'

RSpec.describe Own, type: :model do
  let(:user) { create :user }
  let(:game) { build :game }

  context 'adicionar um elemento à ownlist' do
    it 'adiciona um elemento de Wish' do
      expect { user.ownlist.push game }.to change(user.owns, :count).by(1)
    end
  end

  context 'remover um elemento à ownlist' do
    before(:each) do
      user.ownlist.push game
    end

    it 'remove um elemento de Wish' do
      expect { user.ownlist.delete game }.to change(user.owns, :count).by(-1)
    end

    it 'remove o desejo da tabela' do
      expect { user.ownlist.delete game }.to change(Own, :count).by(-1)
    end
  end
end