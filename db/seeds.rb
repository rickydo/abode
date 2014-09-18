# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
house1 = Dwelling.create(address: "1238 W. Fulton", name: "winterfelyul", admin_id: 1 )
  user1 = house1.users.create(name: "zac", email: "zacmitton22@gmail.com", phone: "8473341606", password: "password" )
    expense1 = user1.expenses.create(name: "rent", description: "the rent", amount: 2000.00 )
    expense2 = user1.expenses.create(name: "electric", description: "comed", amount: 100.00 )
  user2 = house1.users.create(name: "helin", email: "sometinn@gmail.com", phone: "7473341606", password: "password" )
    expense3 = user2.expenses.create(name: "cable", description: "comcast", amount: 200.00 )
    expense4 = user2.expenses.create(name: "water", description: "lake michigan", amount: 20.00 )
  user3 = house1.users.create(name: "brandon", email: "jhfgjfgh@gmail.com", phone: "6473341606", password: "password" )
  user4 = house1.users.create(name: "kyle", email: "sadffdsa@gmail.com", phone: "5473341606", password: "password" )

  user1.user_expenses.create(expense_id: expense1.id, portion: 600.00, paid: 0)
  user2.user_expenses.create(expense_id: expense1.id, portion: 500.00, paid: 0)
  user3.user_expenses.create(expense_id: expense1.id, portion: 500.00, paid: 0)
  user4.user_expenses.create(expense_id: expense1.id, portion: 400.00, paid: 400)

  user1.user_expenses.create(expense_id: expense2.id, portion: 25.00, paid: 25)
  user2.user_expenses.create(expense_id: expense2.id, portion: 25.00, paid: 20)
  user3.user_expenses.create(expense_id: expense2.id, portion: 25.00, paid: 25)
  user4.user_expenses.create(expense_id: expense2.id, portion: 25.00, paid: 10)

  user1.user_expenses.create(expense_id: expense3.id, portion: 50.00, paid: 0)
  user2.user_expenses.create(expense_id: expense3.id, portion: 50.00, paid: 0)
  user3.user_expenses.create(expense_id: expense3.id, portion: 50.00, paid: 0)
  user4.user_expenses.create(expense_id: expense3.id, portion: 50.00, paid: 0)

  user1.user_expenses.create(expense_id: expense4.id, portion: 5.00, paid: 5)
  user2.user_expenses.create(expense_id: expense4.id, portion: 5.00, paid: 0)
  user3.user_expenses.create(expense_id: expense4.id, portion: 5.00, paid: 0)
  user4.user_expenses.create(expense_id: expense4.id, portion: 5.00, paid: 0)


house2 = Dwelling.create(address: "1239 W. Fulton", name: "winterftyuell", admin_id: 5 )
  user5 = house2.users.create(name: "anonymous", email: "somebody@gmail.com", phone: "8473341606", password: "password" )











