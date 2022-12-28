# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Student.create(roll_number:"202010660",first_name:"Yannick Dev",street_address:"KG 14 Ave",phone_number:"0783020147")
Student.create(roll_number:"TE4J00893",first_name:"Tatianna Syndie",street_address:"Gisozi",phone_number:"0754342324")
Student.create(roll_number:"TGE4J00KKO03",first_name:"Sylvana",street_address:"Kagugu",phone_number:"099303244")
Student.create(roll_number:"00KLK@O",first_name:"Titanesk Kwillu",street_address:"Kolwezi Quartier B",phone_number:"081230433")

Teacher.create(employee_code: "09KU9930P", full_name: "Murielle Benine", incharge_class: "5eme P", subject_handling: "Geographie", phone_number: "0998372222", picture: "wwwee.piclsewe.jpeg")
Teacher.create(employee_code: "09KU9933", full_name: "Aksanti Mulebwa Justin", incharge_class: "6eme P", subject_handling: "Anatomie", phone_number: "099837221",picture: "sehss.jeg")