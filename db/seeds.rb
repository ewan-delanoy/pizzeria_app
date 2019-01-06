# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email:"luke.skywalker@example.com",
            first_name:"Luke",
            last_name:"Skywalker",
            password:"password");

User.create(email:"peggy.lee@heythere.com",
            first_name:"Peggy",
            last_name:"Lee",
            password:"password");

Admin.create(name:"Maxime",
            password:"password");

meals=["Fermière","Trois Fromages","Anchois","Provençale","Forestière","Nordique"]
states=["Reçue","Acceptée","Refusée","En préparation","En cours de livraison","Livrée"]

for i in 0..5
  for j in 0..5
    temp_user = User.find(((i+j)%2)+1)
    Order.create(recipe:meals[i],
                   user: temp_user,
                  state:states[j])
  end
end
