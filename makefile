server:
	shotgun -o 0.0.0.0

console:
	irb -r ./app

seed:
	ruby seeds.rb
