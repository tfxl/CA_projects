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
        sleep 5 # use a keypress to exit this instead

    end

    

end



bob = Introduction.new
bob.display_intro



