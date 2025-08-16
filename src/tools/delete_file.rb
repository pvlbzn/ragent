require "ruby_llm/tool"

module Tools
  class DeleteFile < RubyLLM::Tool
    description "Delete a file at a given path. If the file doesn't exist, do nothing."
    param :path, desc: "The path to the file"

    def execute(path:)
      puts "Deleting file #{path}..."
      print "Allow deletion? (y/n)"

      response = gets.chomp
      return { error: "deletion of #{path} allowed by user" } unless response == "y"
      
      File.delete(path)
    rescue => e
      { error: e.message }
    end
  end
end