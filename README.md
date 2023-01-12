# Aplicación Rails

Desarrollo web perteneciente al Trabajo Final Integrador (TFI) de la cursada 2022 correspondiente a la materia Taller de Tecnología de Producción de Software - Opción Ruby (TTPS-Ruby), de la Facultad de Informatica de la Universidad Nacional de La Plata.

# Contexto del proyecto

Un importante banco de la Argentina está buscando modernizar la forma en que gestiona los turnos para la atención presencial en sus sucursales y para eso te encomendaron un desarrollo. En la actualidad, cualquier cliente debe acercarse a la sucursal para solicitar un turno para atención y luego esperar a que se le llame. El banco quiere poder ofrecer un sistema de turnos online, para que cualquier persona pueda solicitar un turno para ser atendido en una sucursal sin necesidad de acercarse a ésta
y tener que esperar a ser atendida. 

## Requisitos técnicos

Se utiliza para la implementación de la aplicación: El framework Ruby on Rails en su versión 7.0.2, el lenguaje de programación Ruby v2.7.4. Se utiliza como base de datos la brindada por defecto por el framework Rails llamado SQLite3 v1.5.3.
Para las vistas se conto con el framework bootstrap 5.

El proyecto rails cuenta con el archivo `Gemfile`, en donde se encuentran todas las gemas requeridas para la correcta funcionalidad de la aplicación. 

Para poder ejecutarlo se necesita:

```bash
$   bundle install
```    
## Inicio de la aplicación

Para ejecutar la aplicación se requiere del siguiente comando: 

```bash
$   rails server
```  
## Datos de prueba

### Carga de datos

En el archivo `db/seeds.rb` se encuentran datos de prueba para poder iniciar la aplicación sin la necesidad de generar manualmente cada dato requerido.

Para cargar los datos de prueba en la aplicación: 

```bash
$   rails db:seed
```  
Si al utilizar la aplicación se modifican, eliminal o genera nueva información y se desea resetear la base de datos a los datos de pruebas originales, se puede ejecutar:

```bash
$   rails db:reset
```  
### Datos brindados

En el archivo `db/seeds.rb` se encuentran los siguientes usuarios que se podran utilizar si se han cargado en la aplicación como se explico anteriormente.

```bash
$   User.create(email: 'admin@gmail.com', name: 'Juan', surname: 'Hernandez', password: 'administrador', password_confirmation: 'administrador', role_id: admin.id)
User.create(email: 'personal@gmail.com', name: 'Sofia', surname: 'Cruz', password: 'personal', password_confirmation: 'personal' , role_id: personal.id, branch_office_id: branch_office.id)
User.create(email: 'cliente@gmail.com', name: 'Jose', surname: 'Peralta', password: 'cliente', password_confirmation: 'cliente', role_id: client.id)
``` 
El primer usuario cuyo rol es `Administrador`, puede iniciar sesión ingresando como email `admin@gmail.com` y contraseña `administrador`. La principal funcionalidad de su rol es la de administrar los diferentes modelos que utiliza la aplicación, en lo que abarca la creación, edición, eliminación de sucursales, localidades, franjas horarias, etc. y hasta la posibilidad de crear nuevos usuarios para el sistema.

El segundo usuario cuyo rol es `Personal bancareo`, puede iniciar sesión ingresando como email `personal@gmail.com` y contraseña `personal`. La principal funcionalidad de su rol es la de atender los turnos que se encuentren `pendientes` en la sucursal en la que se encuentra relacionada.

El  tercer usuario cuyo rol es `Cliente`, puede iniciar sesión ingresando como email `cliente@gmail.com` y contraseña `cliente`. La principal funcionalidad de su rol es la de solicitar turnos en las distintas sucursales del sistema y visualizar su lista de turnos que se encuentren en estado `pendiente` o `atendido`.

## Implementación de clases

### Clase Appointment

Turnos que seran solicitadas por los usuarios cuyo rol sean `Cliente`, y que seran atendidos por los usuarios cuyo rol sean `Personal`.

Atributos de Instancia
 
*  `date`: Fecha en la que se encuentra programado el turno.
*  `hour`: Hora en la que se encuentra programo el turno. 
*  `reason`: Razon por la que se solicito el turno.
*  `result`: Resultado documentado del turno una vez obtenido. (Puede ser nulo)
*  `user`: Usuario con rol de cliente que solicita el turno.
*  `branch_office`: Sucursal en donde se llevara a cabo el turno.
*  `personal_id`: Id del personal que se encargo de atender al cliente. (Puede ser nulo)
*  `state`: Estado en el que se encuentra el turno en el sistema.
 
### Clase Attention_time

Franja horaria en la que se permitiran la atención de los turnos solicitados por los clientes en el sistema.
 
Atributos de Instancia
 
*  `hour_start`: Inicio de la franja horaria en el que comienza la atención.
*  `hour_end`: Fin de la franja horaria en la que finaliza la atención.
 
### Clase Branch_office

Sucursales del banco que se encuentran cargadas en el sistema para la atención de los turnos.
 
Atributos de Instancia

*  `name`: Nombre de la sucursal.
*  `direction`: Dirección específica en donde se encuentra la sucursal.
*  `phone`: Número de telefono correspondiente a la sucursal.
*  `location`: Localización en la que se encuentra la sucursal.
 
### Clase Location
 
Localidades utilizada para identificar la ubicación de las sucursales cargadas en el sistema.

Atributos de Instancia
 
*  `name`: Nombre de la localidad.
*  `province`: Provincia en donde se encuentre la localidad.
 
### Clase Province

Provincia para identificar la ubicación de las localidades cargadas en el sistema.
 
Atributos de Instancia
 
*  `name`: Nomber de la provincia.
 
### Clase Role

Roles que se asignaran a los usuarios del sistema para permitir distintas funcionalidades en la aplicación.

Atributos de Instancia
 
*  `name`: Nombre del rol.
 
### Class State
 
Estados en los que se encontraran los turnos generados en el sistema.

Atributos de Instancia
 
*  `name`: Nombre del estado.

### Clase User

Usuarios registrados que interactuaran con el sistema según sea el rol de cada uno.

Atributos de Instancia 

*  `email`: Email del usuario.
*  `name`: Nombre del usuario.
*  `surname`: Apellido del usuario.
*  `role`: Rol con el cual se desempeñara el usuario en el sistema
*  `branch_office_id`: Id de la sucursal en la que se encuentra relacionado el usuario (Puede ser nulo).

### Clase Working_day

Dias de trabajos que se relacionaran entre la sucursal y la franja horaria para determinar los dias en los que trabajaran cada una de las sucursales.

Atributos de Instancia

*  `day`: Número de dia de la semana.
*  `branch_office`: Sucursal en la que se le asigna al dia de atención. 
*  `attention_time`: Franja horaria en la que se asigna al día de atención. 

## Gemas

Para la implementación del proyecto se aprovechan las funcionalidades de distintas gemas que se encuentran disponible.

### Gema devise

Se encarga de la implementación de la autenticación de los diferentes usuarios que interactuan con la aplicación generando una session al usuario registrado y permitir saber quien se encuentra navegando por el sistema.

Ademas de brindar diferentes vistas como la encargada de iniciar sesion o registrar usuario.

### Gema cancancan

Se encarga de brindar las metodologias encargadas de brindar las autorizaciones a los distintos espacios del sistema en base al rol de cada usuario.

En base a un modelo Ability.rb permite personalizar los permisos a los distintos usuarios por el rol que cuantan cada uno.



