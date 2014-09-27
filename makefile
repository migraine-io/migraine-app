server:
	env $$(cat .env) shotgun -o 0.0.0.0

console:
	env $$(cat .env) irb -r ./app

seed:
	env $$(cat .env) ruby seeds.rb
