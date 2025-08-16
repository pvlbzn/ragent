# Ragent - Ruby AI Coding Assistant

> [!NOTE]
> This documentation was created by Ragent itself.

Ragent is an AI-powered coding assistant built in Ruby that provides an interactive command-line interface for file system operations, code editing, and shell command execution.

## Features

- **Interactive Chat Interface**: Natural language conversation with AI assistant
- **File System Operations**: Read, edit, create, and delete files and directories
- **Shell Command Execution**: Run system commands with user confirmation
- **Safety Mechanisms**: User confirmation required for destructive operations
- **Code-Focused**: Specialized instructions for clean, maintainable code generation

## Architecture

### Core Components

```
ragent/
├── run.rb              # Entry point and configuration
├── src/
│   ├── agent.rb        # Main agent class with chat logic
│   └── tools/          # Tool implementations
│       ├── read_file.rb
│       ├── list_files.rb
│       ├── edit_file.rb
│       ├── delete_file.rb
│       ├── create_directory.rb
│       ├── delete_directory.rb
│       └── shell.rb
├── Gemfile             # Dependencies
└── Gemfile.lock
```

### Agent Class

The `Agent` class orchestrates the interaction between the user, the LLM, and the available tools:

- **Chat Management**: Initializes and manages the LLM conversation
- **Tool Registration**: Registers all available tools with the LLM
- **Instructions**: Provides coding-focused system instructions
- **Main Loop**: Handles user input and displays AI responses

### Tools System

Each tool is implemented as a separate class inheriting from `RubyLLM::Tool`:

| Tool | Description | Safety |
|------|-------------|---------|
| `ReadFile` | Read file contents | Safe |
| `ListFiles` | List directory contents | Safe |
| `EditFile` | Edit files with string replacement | Safe |
| `CreateDirectory` | Create new directories | Safe |
| `DeleteFile` | Delete files | User confirmation required |
| `DeleteDirectory` | Delete directories | User confirmation required |
| `Shell` | Execute shell commands | User confirmation required |

## Prerequisites

- Ruby 2.7+ 
- Bundler gem
- Anthropic API key

## Installation

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd ragent
   ```

2. **Install dependencies**:
   ```bash
   bundle install
   ```

3. **Set up environment variable**:
   ```bash
   export ANTHROPIC_API_KEY="your-api-key-here"
   ```

## Usage

### Starting Ragent

```bash
ruby run.rb
```

You'll see:
```
Ragent is ready. Type `exit` to exit.
> 
```

### Example Interactions

**Read a file**:
```
> Can you show me the contents of src/agent.rb?
```

**Create and edit a file**:
```
> Create a new Ruby class called Calculator in a file named calculator.rb
```

**List project structure**:
```
> Show me all the files in this project
```

**Execute shell commands**:
```
> Run the tests for this project
```

**File system operations**:
```
> Create a new directory called 'tests' and add a simple test file
```

### Safety Features

Destructive operations require explicit user confirmation:

```
> Delete the old_file.rb
Deleting file old_file.rb...
Allow deletion? (y/n)
```

### Exiting

Type `exit` to quit the application:
```
> exit
```

## Configuration

The agent is configured in `run.rb`:

- **Model**: Uses `claude-sonnet-4-20250514`
- **API Key**: Retrieved from `ANTHROPIC_API_KEY` environment variable
- **Instructions**: Focused on clean, concise coding practices

## Development

### Adding New Tools

1. Create a new file in `src/tools/`
2. Inherit from `RubyLLM::Tool`
3. Define description and parameters
4. Implement the `execute` method
5. Register in `src/agent.rb`

Example:
```ruby
module Tools
  class MyTool < RubyLLM::Tool
    description "Description of what this tool does"
    param :param_name, desc: "Parameter description"

    def execute(param_name:)
      # Implementation
    end
  end
end
```

### Error Handling

All tools include error handling that returns error messages to the LLM:

```ruby
rescue => e
  { error: e.message }
end
```

## Dependencies

- **ruby_llm**: Core LLM integration and tool framework
- **Standard Ruby libraries**: File system and shell operations
