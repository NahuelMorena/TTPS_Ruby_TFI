# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Roles
Role.create(name: 'Administrador')
Role.create(name: 'Personal bancario')
Role.create(name: 'Cliente')

# Provincias
Province.create(name: 'Buenos Aires')
Province.create(name: 'Ciudad Autónoma de buenos Aires')
Province.create(name: 'Catamarca')
Province.create(name: 'Chaco')
Province.create(name: 'Chubut')
Province.create(name: 'Córdoba')
Province.create(name: 'Corrientes')
Province.create(name: 'Entre Riós')
Province.create(name: 'Formosa')
Province.create(name: 'Jujuy')
Province.create(name: 'La Pampa')
Province.create(name: 'La Rioja')
Province.create(name: 'Mendoza')
Province.create(name: 'Misiones')
Province.create(name: 'Neuquén')
Province.create(name: 'Río Negro')
Province.create(name: 'Salta')
Province.create(name: 'San Juan')
Province.create(name: 'San Luis')
Province.create(name: 'Santa Cruz')
Province.create(name: 'Santa Fe')
Province.create(name: 'Santiago del Estero')
Province.create(name: 'Tierra del Fuego')
Province.create(name: 'Tucumán')