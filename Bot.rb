 require 'sqlite3'

  # Code to open the SQlite database.
  @db = SQLite3::Database.open "data.db"


  # Method used to start the information gathering.
  def start
    puts "Enter a Bots name:"
    @name = gets.chomp
    puts "Enter the age:"
    @age = gets.chomp
    puts "Enter a job:"
    @job = gets.chomp
  end


  # Method used to insert the data into SQlite.
  def insert
    {
      "name:" => @name,
      "age:" => @age,
      "job:" => @job
    }.each do |pair|
      @db.execute "insert into bots values ( ?, ?,? )", pair
    end
  end


  # Method used to put info on the created bot and asks to show all bots.
  def view
    puts "Your bot has been added..."
    puts "The name is #{@name} and the age is #{@age} and the job is #{@job}"
    sleep 3
    puts "Would you like to list all the bots?"
    answer = gets.chomp.downcase

    if answer == "yes"
      @db.execute( "select * from bots" ) do |row|
      puts  row 
    end
  else
    puts "Goodbye!"
  end


  # Close the SQlite data connection.
  @db.close()
end


# Start the sections of the program.
start
insert
view
