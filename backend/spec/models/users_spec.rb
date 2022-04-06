require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = create(:user)
  end

  describe 'バリデーション' do
    context "成功パターン" do
      it 'nameの値が設定されていれば、OK' do
        expect(@user.valid?).to eq(true)
      end
      it 'emailの値がなくても、OK' do
        expect(@user.valid?).to eq(true)
      end
    end

    context "失敗パターン" do
      it 'nameが空だとNG' do
        @user.name = ''
        expect(@user.valid?).to eq(false)
      end

      it 'nameが重複しているとNG' do
        @user = build(:user)
        expect(@user.valid?).to eq(false)
      end
    end
  end

end