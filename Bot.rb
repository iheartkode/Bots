 require 'sqlite3'
  #Open the SQLite3 Database
@db = SQLite3::Database.open "data.db"

#Getting information to create a bot with
  def start
    puts "Enter a Bots name:"

    @name = gets.chomp

    puts "Enter the age:"

    @age = gets.chomp

    puts "Enter a job:"

    @job = gets.chomp
end
#Inserting data in to data.db
  def insert
    {
      "name:" => @name,
      "age:" => @age,
      "job:" => @job
    }.each do |pair|
    @db.execute "insert into bots values ( ?, ?,? )", pair
    puts "Your bot has been added..."
  end
end
#Showing inserted bots data and asks to show all bots.
  def view
    puts "His name is #{@name} and his age is #{@age} and his job is #{@job}"
    sleep 3
    puts "Would you like to list all the bots?"
    answer = gets.chomp.downcase
#Asking if they want to see all the bots.
    if answer == "yes"
      @db.execute( "select * from bots" ) do |row|
    puts  row 
    end
  else
    puts "Goodbye!"
  end
#Close the connection
@db.close()

end

start()
insert()
view()
