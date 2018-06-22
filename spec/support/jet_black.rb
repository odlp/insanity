require "jet_black/rspec"
require "jet_black"

JetBlack.configure do |config|
  config.path_prefix = File.expand_path("../../exe", __dir__)
end
