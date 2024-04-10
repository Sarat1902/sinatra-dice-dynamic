require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/dynamic/:number_of_dice/:how_many_sides") do
  
  @number_of_dice = params.fetch("number_of_dice").to_i
  @how_many_sides = params.fetch("how_many_sides").to_i

  @rolls = []

  @number_of_dice.times do
    die = rand(1..@how_many_sides)

    @rolls.push(die)
  end

  erb(:flexible)
end
