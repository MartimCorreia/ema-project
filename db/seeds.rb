# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts 'Cleaning database...'
Patient.destroy_all
User.destroy_all
Procedure.destroy_all
Treatment.destroy_all
Condition.destroy_all
InjuryType.destroy_all
InjuryLocation.destroy_all

puts "creating users..."
file = URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1662117502/EMA/users/luis_clbu66_iovqga.jpg")
user1 = User.new(first_name:"Luis", last_name:"Campos", email:"luis@mail.com", password: "123123" )
user1.photo.attach(io: file, filename: "Luis", content_type:"image/png")
user1.save

file = URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1662119256/EMA/users/martim_ca53jw.jpg")
user2 = User.new(first_name:"Martim", last_name:"Correia", email:"martim@mail.com", password: "123123" )
user2.photo.attach(io: file, filename: "Luis", content_type:"image/png")
user2.save

file = URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1662119256/EMA/users/bryan_rosymc.jpg")
user3 = User.new(first_name:"Bryan", last_name:"Wong", email:"bryan@mail.com", password: "123123" )
user3.photo.attach(io: file, filename: "Luis", content_type:"image/png")
user3.save


puts "creating injury locations..."
il1 = InjuryLocation.new(name:"head")
il1.save

il2 = InjuryLocation.new(name:"torax")
il2.save

il3 = InjuryLocation.new(name:"abdomen")
il3.save

il4 = InjuryLocation.new(name:"leg")
il4.save

il5 = InjuryLocation.new(name:"arm")
il5.save
puts "Done."

puts "creating injury type..."
file = URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661939294/EMA/medical_hrydgn.jpg")
it1 = InjuryType.new(name:"medical")
it1.photo.attach(io: file, filename:"medical", content_type:"image/png")
it1.save

file = URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661939292/EMA/trauma_bwogtg.jpg")
it2 = InjuryType.new(name:"trauma")
it2.photo.attach(io: file, filename: "trauma.png", content_type:"image/png")
it2.save
puts "Done."

puts "creating condition..."
file = URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661938839/EMA/1_jqen3i.jpg")
c1 = Condition.new(name:"dyspnea", description: "shortness of breathing")
c1.photo.attach(io: file, filename: "Dyspneia.png", content_type:"image/png")
c1.save

file = URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661938838/EMA/2_agdstz.jpg")
c2 = Condition.new(name:"chest pain", description: "chest tightness")
c2.photo.attach(io: file, filename: "Chest_Pain.png", content_type:"image/png")
c2.save

file = URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661938838/EMA/8_a7qx7o.jpg")
c3 = Condition.new(name:"fracture", description: "broken bone")
c3.photo.attach(io: file, filename: "Frcture.png", content_type:"image/png")
c3.save

file = URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661938838/EMA/5_t1xie2.jpg")
c4 = Condition.new(name:"burn", description: "blisters")
c4.photo.attach(io: file, filename: "Burn.png", content_type:"image/png")
c4.save

file = URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661938838/EMA/9_x1unfm.png")
c5 = Condition.new(name:"abdominal pain", description: "shortness of breathing")
c5.photo.attach(io: file, filename: "Abdominal_pain.png", content_type:"image/png")
c5.save

file = URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661938838/EMA/4_l0jk2t.jpg")
c6 = Condition.new(name:"nose bleed", description: "bleeding from nose")
c6.photo.attach(io: file, filename: "Nose_Bleed.png", content_type:"image/png")
c6.save

file = URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661938838/EMA/6_bwobnj.png")
c7 = Condition.new(name:"bleeding", description: "actibe bleeding")
c7.photo.attach(io: file, filename: "Bleeding.png", content_type:"image/png")
c7.save

file = URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661938838/EMA/7_vyxtc1.jpg")
c8 = Condition.new(name:"open fracture", description: "exposed bone")
c8.photo.attach(io: file, filename: "Open_Fracture.png", content_type:"image/png")
c8.save

file = URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661938838/EMA/3_ud6ji5.jpg")
c9 = Condition.new(name:"wound", description: "wound")
c9.photo.attach(io: file, filename: "Wound.png", content_type:"image/png")
c9.save

file = URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661938838/EMA/10_vqbl2g.jpg")
c10 = Condition.new(name:"amputation", description: "loss of body segment")
c10.photo.attach(io: file, filename: "Amputation.png", content_type:"image/png")
c10.save
puts "Done."

puts "creating treatments..."
t1 = Treatment.new(age_group: "child", content: "Protocolo", injury_location_id: il2.id, injury_type_id: it1.id, condition_id: c1.id)
t1.images.attach(io: URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661981398/EMA/Protocolos/dispneia_flibk9.pdf"), filename: 'file.pdf')
t1.save

t2 = Treatment.new(age_group: "adult", content: "Protocolo", injury_location_id: il2.id, injury_type_id: it1.id, condition_id: c2.id)
t2.images.attach(io: URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661981398/EMA/Protocolos/dor_toracica_oiv7ds.pdf"), filename: 'file.pdf')
t2.save

t3 = Treatment.new(age_group: "adult", content: "Protocolo", injury_location_id: il2.id, injury_type_id: it2.id, condition_id: c3.id)
t3.images.attach(io: URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661981398/EMA/Protocolos/trauma_e4rbgz.pdf"), filename: 'file.pdf')
t3.save

t4 = Treatment.new(age_group: "child", content: "Protocolo", injury_location_id: il3.id, injury_type_id: it2.id, condition_id: c4.id)
t4.images.attach(io: URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661981398/EMA/Protocolos/queimaduras_up3pfr.pdf"), filename: 'file.pdf')
t4.save

t5 = Treatment.new(age_group: "adult", content: "Protocolo", injury_location_id: il2.id, injury_type_id: it2.id, condition_id: c9.id)
t5.images.attach(io: URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661981398/EMA/Protocolos/trauma_e4rbgz.pdf"), filename: 'file.pdf')
t5.save

t6 = Treatment.new(age_group: "adult", content: "Protocolo", injury_location_id: il4.id, injury_type_id: it2.id, condition_id: c4.id)
t6.images.attach(io: URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661981398/EMA/Protocolos/queimaduras_up3pfr.pdf"), filename: 'file.pdf')
t6.save

t7 = Treatment.new(age_group: "adult", content: "Protocolo", injury_location_id: il4.id, injury_type_id: it2.id, condition_id: c7.id)
t7.images.attach(io: URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661981398/EMA/Protocolos/trauma_e4rbgz.pdf"), filename: 'file.pdf')
t7.save

t8 = Treatment.new(age_group: "adult", content: "Protocolo", injury_location_id: il4.id, injury_type_id: it2.id, condition_id: c8.id)
t8.images.attach(io: URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661981398/EMA/Protocolos/trauma_e4rbgz.pdf"), filename: 'file.pdf')
t8.save

t9 = Treatment.new(age_group: "adult", content: "Protocolo", injury_location_id: il4.id, injury_type_id: it2.id, condition_id: c9.id)
t9.images.attach(io: URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661981398/EMA/Protocolos/trauma_e4rbgz.pdf"), filename: 'file.pdf')
t9.save

t10 = Treatment.new(age_group: "adult", content: "Protocolo", injury_location_id: il4.id, injury_type_id: it2.id, condition_id: c10.id)
t10.images.attach(io: URI.open("https://res.cloudinary.com/dluisdviu/image/upload/v1661981398/EMA/Protocolos/trauma_e4rbgz.pdf"), filename: 'file.pdf')
t10.save
puts "Done."
