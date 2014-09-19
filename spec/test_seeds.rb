  # users = [User.create(name: )

  house1 = Dwelling.create(address: "1238 W. Fulton", name: "winterfelyul", admin_id: 1 )
  house2 = Dwelling.create(address: "1239 W. Fulton", name: "winterftyuell", admin_id: 1 )
  house1.users.create(name: "zac", email: "zacmitton22@gmail.com", phone: "8473341606", password: "password" )
  house1.users.create(name: "helin", email: "sometinn@gmail.com", phone: "7473341606", password: "password" )
  house1.users.create(name: "brandon", email: "jhfgjfgh@gmail.com", phone: "6473341606", password: "password" )
  house1.users.create(name: "kyle", email: "sadffdsa@gmail.com", phone: "5473341606", password: "password" )

