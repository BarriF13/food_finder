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
    # action loop do
    # what do you want to do ?(list, find, add , quit)
    #do that action
    # repeat until user quits
    conclusion
  
  end

  def introduction
    puts "\n\n<<< Welcome to the Food Finder >>>\n\n"
    puts "This is an interactive guide to help you find the food you crave.\n\n"
  end

  def conclusion
    puts "\n<<< Goodbye and Bon Apetit! >>>\n\n\n"
  end
end