require "ruby_llm"
require_relative "tools/read_file"
require_relative "tools/list_files"
require_relative "tools/edit_files"
require_relative "tools/delete_file"
require_relative "tools/create_directory"
require_relative "tools/delete_directory"
require_relative "tools/shell"


class Agent
  def initialize
    @chat = RubyLLM.chat
    @chat.with_tools(
      Tools::ReadFile, 
      Tools::ListFiles, 
      Tools::EditFile,
      Tools::DeleteFile,
      Tools::Shell,
      Tools::CreateDirectory,
      Tools::DeleteDirectory,
    )
  end

  def run
    puts "Chat with the agent. Type `exit` to exit."

    loop do
      print "> "
      user_input = gets.chomp
      break if user_input == "exit"

      response = @chat.ask user_input
      puts response.content
    end
  end
end
