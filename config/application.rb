require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.time_zone = 'Asia/Tokyo'

    config.generators do |g|
      g.test_framework :rspec,
      # テストDBにレコードを作成するファイルの作成をスキップする
      fixtures: false,
      # falseはビュースペックを作成しない。代わりにフィーチャースペックでUIをテストする
      view_specs: false,
      # falseはヘルパーファイル用のスペックを作成しないことを指定する。Rspecを自在に操れるようになってきたらtrueにしてヘルパーファイルをテストする
      helper_specs: false,
      # falseはroutes.rb用のスペックファイルの作成を省略する。アプリが大きくなり、ルーティングが複雑化してきたらtrueにする
      routing_specs: false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
