require 'rails_helper'

describe "タスク管理機能", type: :system do
    describe "一覧表示機能" do
        before do
            # ユーザーAを作成
            user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
            # 作成者がユーザーAであるタスクを作成しておく
            FactoryBot.create(:task, name: '最初のタスク', user: user_a)
        end

        context "ユーザーAがログインしているとき" do
            before do
                # ユーザーAでログインする visitでURLにアクセス
                visit login_path
                # fill_inでテキスト入力
                fill_in 'メールアドレス', with: 'a@example.com', match: :first
                fill_in 'パスワード', with: 'password', match: :first
                click_button 'ログインする'
            end

            it 'ユーザーAが作成したタスクが表示される' do
                # 作成済みのタスクの名称が画面上に表示されていることを確認
                expect(page).to have_content '最初のタスク'
            end
        end
    end
end
