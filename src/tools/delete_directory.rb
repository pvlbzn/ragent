require "ruby_llm/tool"

module Tools
  class DeleteDirectory < RubyLLM::Tool
    description "Delete a directory at a given path. If the directory doesn't exist, do nothing."
    param :path, desc: "The path to the directory"

    def execute(path:)
      puts "Deleting directory #{path}..."
      print "Allow deletion? (y/n)"

      response = gets.chomp
      return { error: "deletion of directory #{path} not allowed by user" } unless response == "y"
      
      Dir.rmdir(path)
    rescue => e
      { error: e.message }
    end
  end
end