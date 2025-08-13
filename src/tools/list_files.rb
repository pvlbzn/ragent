require "ruby_llm/tool"

module Tools
  class ListFiles < RubyLLM::Tool
    description "List files and directories at a given path. If no path is provided, lists files in the current directory."
    param :path, desc: "Optional relative path to list files from. Defaults to the current directory if not provided."

    def execute(path: "")
      puts "Listing files at #{path}..."
      Dir.glob(File.join(path, "*")).map {
        |f| File.directory?(f) ? "#{f}/" : f
      }
    rescue => e
      { error: e.message }
    end
  end
end
