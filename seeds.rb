require_relative "app"

Ohm.redis.call("FLUSHDB")

user = User.create(name: "Rocio", email:"rocio@gmail.com", password: "123456")

Type.create(category: "Food", name: "Chocolate", user: user)

Type.create(category: "Food", name: "cheese", user: user)

Type.create(category: "Food", name: "Skip dinner", user: user)

Type.create(category: "Drink", name: "Cofee", user: user)

Type.create(category: "Drink", name: "Soda", user: user)

Type.create(category: "Drink", name: "Acoholic beverages", user: user)

Type.create(category: "Symptoms", name: "Nausea or vomiting", user: user)

Type.create(category: "Symptoms", name: "Sensitive to light, noise, smell", user: user)

Type.create(category: "Body Changes", name: "Mentruation or Skip menstruation", user: user)

Type.create(category: "Body Changes", name: "Stress", user: user)

Type.create(category: "Medication", name: "Ergotamin", user: user)

Type.create(category: "Medication", name: "Exedrin", user: user)

Type.create(category: "Medication", name: "Aspirin", user: user)
