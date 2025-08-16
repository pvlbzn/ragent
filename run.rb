require "ruby_llm"
require_relative "src/agent"

RubyLLM.configure do |config|
  config.openai_api_key = ENV.fetch("OPENAI_API_KEY")
  config.default_model = "gpt-4.1"
end

Agent.new.run
