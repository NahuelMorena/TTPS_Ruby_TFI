# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Roles
admin = Role.create(name: 'Administrador')
personal = Role.create(name: 'Personal bancario')
client = Role.create(name: 'Cliente')

# Estados
State.create(name: 'Pendiente')
State.create(name: 'Atendido')
State.create(name: 'Cancelado')

# Provincias
province = Province.create(name: 'Buenos Aires')
Province.create(name: 'CABA')
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

# Localidades
location1 = Location.create(name: 'La Plata', province: province)
location2 = Location.create(name: 'Berisso', province: province)

# Tiempos de atención
attention_time = AttentionTime.create(hour_start: '08:00', hour_end: '12:00')
AttentionTime.create(hour_start: '09:00', hour_end: '13:00')
AttentionTime.create(hour_start: '08:30', hour_end: '12:30')

# Sucursales
branch_office = BranchOffice.create(name: 'San Martin', direction: 'calle 56', phone: '221-453256', location: location1)
BranchOffice.create(name: 'Belgrano', direction: 'calle 122', phone: '221-123454', location: location2)

# Dias de trabajo
WorkingDay.create(day: '1', branch_office: branch_office, attention_time: attention_time)

# Usuarios
User.create(email: 'admin@gmail.com', name: 'Juan', surname: 'Hernandez', password: 'administrador', password_confirmation: 'administrador', role_id: admin.id)
User.create(email: 'personal@gmail.com', name: 'Sofia', surname: 'Cruz', password: 'personal', password_confirmation: 'personal' , role_id: personal.id, branch_office_id: branch_office.id)
User.create(email: 'cliente@gmail.com', name: 'Jose', surname: 'Peralta', password: 'cliente', password_confirmation: 'cliente', role_id: client.id)
