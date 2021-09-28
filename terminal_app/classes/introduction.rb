require 'tty-markdown'
require 'tty-prompt'

class Introduction

    attr_reader :name 

    def initialize

        @introduction = TTY::Markdown.parse_file('../introduction.md')
        # @user_name = "No username currently given"
        # @name = self.request_details

    end

    def display_intro()

        puts @introduction

        prompt = TTY::Prompt.new
        prompt.keypress("Press space or enter to continue", keys: [:space, :return])

    end

    

end



# bob = Introduction.new
# bob.display_intro



