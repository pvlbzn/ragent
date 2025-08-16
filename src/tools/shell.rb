require "ruby_llm/tool"

module Tools
  class Shell < RubyLLM::Tool
    description "Execute shell commands"
    param :command, desc: "The shell command to execute"

    def execute(command:)
      puts "Pending command: #{command}"
      print "Allow execution? (y/n)"

      response = gets.chomp
      return { error: "command not allowed by user" } unless response == "y"

      `#{command}`
    rescue => e
      { error: e.message }
    end
  end
end