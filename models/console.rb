require_relative('./spacecowboy.rb')

SpaceCowboy.delete_all

cowboy1 = SpaceCowboy.new({ name: "Guy", species: "Lizard", danger_level: "Very Danger, much bad", bounty: 9000})

cowboy1.save
cowboy1.name = "Gergo"
cowboy1.update

# cowboy1.delete

SpaceCowboy.find(1)