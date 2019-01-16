# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email:"richardtabere@gmx.com",
            first_name:"Richard",
            last_name:"Tabere",
            password:"password",
            birthday:DateTime.strptime('18 04 1971','%d %m %Y'),
            mangopay_user_id:60462805,
            mangopay_wallet_id:60462806);

User.create(email:"rebecca.flower@gmx.com",
            first_name:"Rebecca",
            last_name:"Flower",
            password:"password",
            birthday:DateTime.strptime('17 05 1971','%d %m %Y'),
            mangopay_user_id:60462360,
            mangopay_wallet_id:60462361);


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
