require 'tty-markdown'

class Introduction

    def initialize

        @introduction = TTY::Markdown.parse_file('../introduction.md')
    end

    def display_intro()

        puts @introduction

    end

end


bob = Introduction.new
bob.display_intro


