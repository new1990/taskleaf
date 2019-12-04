FactoryBot.define do
    factory :task do
        name { 'テストを書く' }
        description { 'Rspec&Capybara&FactoryBotを準備する' }
        user # 定義した:userという名前のFactoryをTaskモデルに定義されたuserという名前の関連を生成するのに利用する
    end
end