require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/dynamic/:number_of_dice/:number_of_rolls") do
  @num_dice = params.fetch("number_of_dice").to_i
  @num_roll = params.fetch("number_of_rolls").to_i
  @rolls = []

  @num_dice.times do
    die = rand(1..@num_roll)

    @rolls.push(die)
  end

  erb(:flexible)
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  @first_die = first_die
  @second_die = second_die

  erb(:two_six)
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  @first_die = first_die
  @second_die = second_die

  erb(:two_ten)
end

get("/dice/1/20") do
  first_die = rand(1..20)
  second_die = rand(1..20)
	sum = first_die + second_die
  
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  @first_die = first_die
  @second_die = second_die
	
	erb(:one_twenty)
end

get("/dice/5/4") do
  @rolls = []

  5.times do
    roll = rand(1..4)
    @rolls.push(roll)
  end

  sum = @rolls.sum
  @outcome = "You rolled #{@rolls.join(', ')} for a total of #{sum}."

  erb(:five_four)
end

get("/dice/50/6") do
  @rolls = []

  50.times do
    roll = rand(1..6)
    @rolls.push(roll)
  end

  sum = @rolls.sum
  @outcome = "You rolled #{@rolls.join(', ')} for a total of #{sum}."

  erb(:fifty_six)
end
