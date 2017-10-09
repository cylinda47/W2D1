# PHASE 2`
class CoffeeError < StandardError
end
class FruitError < StandardError
end

def convert_to_int(str)
  begin
    input = Integer(str)
    p input
    raise ArgumentError if !input.is_a?(Integer)
  rescue
    puts "This is not a number."
  #ensure
  #  puts "Your number is #{}"
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)

    # if FRUITS.include? maybe_fruit
    #   puts "OMG, thanks so much for the #{maybe_fruit}!"
    # elsif maybe_fruit != "coffee"
    #   raise CoffeeError
    # else #not fruit
    #   raise FruitError
    # end

    if FRUITS.include? maybe_fruit
      return "OMG, thanks so much for the #{maybe_fruit}!"
    elsif maybe_fruit != "coffee"
      raise CoffeeError
    end

    raise FruitError if maybe_fruit == "coffee"

end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue FruitError
    
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    retry
  rescue CoffeeError
    puts "That's not coffee. Give me a real coffee!!"
    retry
  end

end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
