# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Destroy roles before repopulating, because we cant rewrite the primary key and we dont want duplicates
Role.delete_all

Role.create(id: 1, name: 'Admin')
Role.create(id: 2, name: 'Campaign Manager')
Role.create(id: 3, name: 'Specialist')

Customer.create(name: "Panception", id: 1)

Vendor.create(name: "Panception", id: 1)

Vtype.delete_all

Vtype.create(id: 1, name: 'Banking')
Vtype.create(id: 2, name: 'Financial')
Vtype.create(id: 3, name: 'Web Development')
Vtype.create(id: 4, name: 'Aeronautical')

Ctype.delete_all

Ctype.create(id: 1, name: 'Banking')
Ctype.create(id: 2, name: 'Financial')
Ctype.create(id: 3, name: 'Web Development')
Ctype.create(id: 4, name: 'Aeronautical')

#Destroy ReviewerType before repopulating, because we dont want duplicates
ReviewerType.delete_all

ReviewerType.create(id: 1, name: 'Supplier')
ReviewerType.create(id: 2, name: 'Business Unit')
ReviewerType.create(id: 3, name: 'Strategic Sourcing')
ReviewerType.create(id: 4, name: 'Supplier Diversity')
ReviewerType.create(id: 5, name: 'Governance')
ReviewerType.create(id: 6, name: 'SRM')