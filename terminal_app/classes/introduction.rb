require 'tty-markdown'
require 'tty-prompt'

require_relative './file_handler'

class Introduction

  def initialize

    @parsed_markdown = nil
    @file_handler = FileHandler.new # this will be used by all functions, so can be initialized

  end


  ############## LOADS A MARKDOWN FILE WITH EXCEPTION HANDLING INCL THAT FROM FILEHANDLER CLASS ###########

  def load_markdown_file(file_name)

    begin

    @parsed_markdown = TTY::Markdown.parse_file(file_name, width: 90)
    
    rescue Errno::ENOENT => e
      puts Rainbow("\n\nWell now.... file appears to be missing..... I wonder where it went ?").yellow
      sleep 1
      @file_handler.error_message_and_leave(e)

    rescue Errno::EACCES => e
      puts Rainbow("\n\nSo you haven't got permission for this file.... Dunno why.... Guess you're not at Level 8 Clearance..").yellow
      sleep 1
      @file_handler.error_message_and_leave(e)

    # rescue StandardError => err
    rescue StandardError => e
      puts Rainbow("\n\nAwkies.... the file is not loading.... probably a user error :) ").yellow
      sleep 1
      @file_handler.error_message_and_leave(e)

    end

  end
############ ONCE LOADED THE INTRODUCTION CAN BE DISPLAYED. USE FILEHANDLER CLASS's PROMPT ###########


  def display_introduction

    puts @parsed_markdown

    prompt = @file_handler.prompt()
    prompt.keypress("#{Rainbow('Press space or enter to continue').orange}", keys: %i[space return])

  end

############################# COMBINE TWO CLASS FUNCTIONS AS ONE #################################

  def provide_introduction(file_name)

    system("clear") || system("cls")
    load_markdown_file(file_name)
    display_introduction()

  end

end

