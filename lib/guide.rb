require_relative('./restaurant')
class Guide
  
  class Config
    @@actions = ['list','find', 'add','quit']
    def self.actions; @@actions;end
  end

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
    
    action = get_action
    result = do_action(action)
    # repeat until user quits
    end
    conclusion
  end

  def get_action
    action = nil
    #keep asking for user input until we get a valid action
    until Guide::Config.actions.include?(action)
      puts "Actions: "+ Guide::Config.actions.join(", ") if action
      print "> "
      user_response = gets.chomp
      action = user_response.downcase.strip
    end
    return action
  end


  def do_action(action)
    case action
    when 'list'
      list
    when 'find'
      puts 'Finding..'
    when 'add'
      add
    when 'quit'
      return :quit
    else
      puts "\nI don not understand that command.\n"
    end
  end

  def list
    puts "\nListing restaurants\n\n ".upcase

    restaurants = Restaurant.saved_restaurants
    restaurants.each do |rest|
      puts rest.name + " | "+ rest.cuisine + " | " + rest.formatted_price
    end
  end

  def add
    puts "\nAdd a restaurant\n\n ".upcase

    restaurant = Restaurant.build_using_questions

    if restaurant.save
      puts "\n Restaurant added\n\n"
    else
      puts "\nSave Error: Restaurant not added\n\n"
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