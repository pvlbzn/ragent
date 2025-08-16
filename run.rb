require "ruby_llm"
require_relative "src/agent"

RubyLLM.configure do |config|
  config.anthropic_api_key = ENV.fetch("ANTHROPIC_API_KEY")
  config.default_model = "claude-sonnet-4-20250514"
end

Agent.new.run
