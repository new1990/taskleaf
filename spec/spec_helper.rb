# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

# Capybaraを扱うために必要な機能を読み込むために追加
require 'capybara/rspec'

RSpec.configure do |config|

  config.before(:each, type: :system) do
    driven_by :selenium_chrome_headless
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups


end
