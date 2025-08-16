require "ruby_llm/tool"

module Tools
  class CreateDirectory < RubyLLM::Tool
    description "Create a new directory at a given path. If the directory already exists, do nothing."
    param :path, desc: "The path to the directory"

    def execute(path:)
      puts "Creating directory #{path}..."
      
      Dir.mkdir(path)
    rescue => e
      { error: e.message }
    end
  end
end