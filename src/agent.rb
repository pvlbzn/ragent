require "ruby_llm"

require_relative "tools/read_file"
require_relative "tools/list_files"
require_relative "tools/edit_file"
require_relative "tools/delete_file"
require_relative "tools/create_directory"
require_relative "tools/delete_directory"
require_relative "tools/shell"


class Agent
  def initialize
    set_chat
    set_tools
    set_instructions
  end

  def run
    puts "Ragent is ready. Type `exit` to exit."

    loop do
      print "> "
      user_input = gets.chomp
      break if user_input == "exit"

      response = @chat.ask user_input
      puts response.content
    end
  end

  private

  def set_chat
    @chat = RubyLLM.chat
  end

  def set_tools
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

  def set_instructions
    @chat.with_instructions <<~INSTRUCTIONS
      You are a codding assistant. Keep your responses short and concise.
      Keep code short, self explanatory, easy to read and maintain.
      Use best practices of the technology you are working with.
    INSTRUCTIONS
  end
end
