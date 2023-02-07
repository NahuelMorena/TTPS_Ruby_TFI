# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Roles
admin_role = Role.create(name: 'Administrador')
personal_role = Role.create(name: 'Personal bancario')
client_role = Role.create(name: 'Cliente')

# Estados
waiting_state = State.create(name: 'Pendiente')
completed_state = State.create(name: 'Atendido')
cancel_state = State.create(name: 'Cancelado')

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
Location.create(name: 'Ensenada', province: province)

# Tiempos de atención
attention_time_1 = AttentionTime.create(hour_start: '08:00', hour_end: '12:00')
attention_time_2 = AttentionTime.create(hour_start: '09:00', hour_end: '13:00')
attention_time_3 = AttentionTime.create(hour_start: '08:30', hour_end: '12:30')

# Sucursales
branch_office_1 = BranchOffice.create(name: 'San Martin', direction: 'calle 56', phone: '221-453256', location: location1)
branch_office_2 = BranchOffice.create(name: 'Belgrano', direction: 'calle 122', phone: '221-123454', location: location2)

# Dias de trabajo
WorkingDay.create(day: '1', branch_office: branch_office_1, attention_time: attention_time_1)
WorkingDay.create(day: '2', branch_office: branch_office_1, attention_time: attention_time_1)
WorkingDay.create(day: '4', branch_office: branch_office_1, attention_time: attention_time_1)
WorkingDay.create(day: '5', branch_office: branch_office_1, attention_time: attention_time_3)
WorkingDay.create(day: '2', branch_office: branch_office_2, attention_time: attention_time_2)
WorkingDay.create(day: '3', branch_office: branch_office_2, attention_time: attention_time_2)
WorkingDay.create(day: '4', branch_office: branch_office_2, attention_time: attention_time_2)

# Usuarios
User.create(email: 'admin@gmail.com', name: 'Juan', surname: 'Hernandez', password: 'administrador', password_confirmation: 'administrador', role_id: admin_role.id)
personal = User.create(email: 'personal@gmail.com', name: 'Sofia', surname: 'Cruz', password: 'personal', password_confirmation: 'personal' , role_id: personal_role.id, branch_office_id: branch_office_1.id)
client = User.create(email: 'cliente@gmail.com', name: 'Jose', surname: 'Peralta', password: 'cliente', password_confirmation: 'cliente', role_id: client_role.id)

# Turnos
Appointment.create(date: Date.new(2023,2,13), hour: DateTime.new(2000,1,1,9,0), reason: 'Consulta de servicios', result: 'Operación llevada a cabo exitosamente', user_id: client.id, branch_office_id: branch_office_1.id, personal_id: personal.id, state_id: completed_state.id)
Appointment.create(date: Date.new(2023,2,20), hour: DateTime.new(2000,1,1,10,0), reason: 'Retiro de prestamo', result: nil, user_id: client.id, branch_office_id: branch_office_1.id, personal_id: nil, state_id: waiting_state.id)