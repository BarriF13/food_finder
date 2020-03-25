require_relative('./restaurant')
class Guide


  def initialize(path=nil)
    #locate the restaurant text file at path
    Restaurant.filepath = path
      # or creat a new file
      if Restaurant.file_usable?
        puts "Found restaurant file."
      elsif Restaurant.create_file
        puts "restaurant file created."
      else
        #exit if create fails
        puts "Exiting ..\n\n"
        exit!
      end  
  end

  def launch
    introduction
    result = nil
    until result == :quit 
    
    # what do you want to do ?(list, find, add , quit)
    print "> "
    user_response = gets.chomp
    #do that action
    result = do_action(user_response)
    # repeat until user quits
    end
    conclusion
  end

  


  def do_action(action)
    case action
    when 'list'
      puts 'Listing..'
    when 'find'
      puts 'Finding..'
    when 'add '
      puts 'Adding ..'
    when 'quit'
      return :quit
    else
      puts "\nI don not understand that command.\n"
    end

  end

  def introduction
    puts "\n\n<<< Welcome to the Food Finder >>>\n\n"
    puts "This is an interactive guide to help you find the food you crave.\n\n"
  end

  def conclusion
    puts "\n<<< Goodbye and Bon Apetit! >>>\n\n\n"
  end
end