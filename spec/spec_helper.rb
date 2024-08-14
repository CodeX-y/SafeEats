require "draft_matchers"
require "rspec-html-matchers"
require "webmock/rspec"
require "#{File.expand_path('../support/webmock', __FILE__)}"
require "#{File.expand_path('../support/json_output_formatter', __FILE__)}"
require "#{File.expand_path('../support/hint_formatter', __FILE__)}"

RSpec.configure do |config|

  config.include RSpecHtmlMatchers
  config.example_status_persistence_file_path = "examples.txt"

  def h(hint_identifiers)
    hint_identifiers.split.map { |identifier| I18n.t("hints.#{identifier}") }
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  config.profile_examples = 10
  config.order = :random

  Kernel.srand config.seed
end
