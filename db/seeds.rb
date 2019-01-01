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
            password_digest:"blank");

User.create(email:"peggy.lee@heythere.com",
            first_name:"Peggy",
            last_name:"Lee",
            password_digest:"blank");

Order.create(recipe:"Calzone",
            user_id: 2,
            orderer_first_name:"Peggy",
            orderer_last_name:"Lee",
            state:"Reçue");

Order.create(recipe:"Trois fromages",
            user_id: 2,
            orderer_first_name:"Luke",
            orderer_last_name:"Skywalker",
            state:"Reçue");


Order.create(recipe:"Jambon",
            user_id: 2,
            orderer_first_name:"Peggy",
            orderer_last_name:"Lee",
            state:"Reçue");

Order.create(recipe:"Trois fromages",
            user_id: 2,
            orderer_first_name:"Luke",
            orderer_last_name:"Skywalker",
            state:"Reçue");
