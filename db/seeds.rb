# Add seed data here. Seed your database with `rake db:seed`
sophie = Owner.create(name: "Sophie")
Pet.create(name: "Maddy", owner: sophie)
Pet.create(name: "Nona", owner: sophie)

adam = Owner.create(name: "Adam")
Pet.create(name: "Dusty", owner: adam)
Pet.create(name: "Thunder", breed: "Dog", owner: adam)
Pet.create(name: "Hunter", breed: "Horse", owner: adam)
Pet.create(name: "Hunter", breed: "Dog", owner: adam)