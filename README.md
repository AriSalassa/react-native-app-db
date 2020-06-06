<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://www.dcorba.com/wp-content/uploads/2017/11/mysql-logo.png" alt="Project logo"></a>
</p>

<h3 align="center">DB MySQL server</h3>

<p align="center"> 
  Motor: MySQL 8.0. Scripts para generar la base de datos, para insertar algunos datos de prueba y para agergar store procedures o patches si fuera necesario.
  El esquemático se puede acceder abriendo el archivo .vpp utilizando <a href="https://www.visual-paradigm.com/">Visual Paradigm</a>
</p>

## 📝 Diseño de nuestra base de datos.

- [A NIVEL DE BASE DE DATOS](#a-nivel-base-de-datos)
- [A NIVEL DE TABLAS](#a-nivel-de-tablas)
- [A NIVEL DE CAMPOS](#a-nivel-de-campos)
- [A NIVEL DE TIPOS DE DATOS](#a-nivel-de-tipos-de-datos)
- [SEGURIDAD](#seguridad)
- [FUNCIONALIDAD](#funcionalidad)

## 🧐 A NIVEL DE BASE DE DATOS <a name = "a-nivel-base-de-datos"></a>

- El charset de las bases de datos son ‘UTF-8′, en MS SQL SERVER=‘SQL_Latin1_General_CP1_CI_AI’.
- El motor por defecto debe de ser relacional (INNO).
- Nombre de la base de datos en MAYÚSCULA.
- Evitar el uso de tablas temporales, mejor utilizar alguna estructura de datos del lenguaje de programación que estés usando.

## 🏁 A NIVEL DE TABLAS <a name = "a-nivel-de-tablas"></a>

- El nombre de las tablas debe ser en mayúsculas o CamelCase.
- El nombre de las tablas debe ser en singular.
- El nombre de las tablas debe ser descriptivo.

## 🔧 A NIVEL DE CAMPOS <a name = "a-nivel-de-campos"></a>

- Todas las tablas deben de tener un Primary Key (PK) y debe de ser el primer campo de la tabla y ser único e irrepetible.
- Ademas del PK se sugiere que todas las tablas tengan los siguientes campos: Estatus (status), Fecha Alta (registeredTime), Fecha Ultima Modificación (modificationTime), Fecha Baja (retiredTime).
- El nombre de los campos/columnas deben ser en singular.
- El PK de todas las tablas debe de ser un entero (INT o BIGINT), único, autoincremental, indexado y será ascendente.
- El nombre del PK empieza será 'id'.
- Los FK, deben ser un entero (INT o BIGINT), indexados, y con la sgte. nomenclatura: ‘FK_ID_NOMBRE_DE_LA_TABLA’, ‘FK_ID_APELLIDO_PATERNO’, ‘ID_CONTACTO_TELEFONO_TABLA1_TABLA2′.
- El nombre de los campos deben de ser en CamelCase, empiezar en minúsculas, no tener espacios o guiones bajos.
- Evitar usar ‘NULL’.
- Todos los campos status deben estar indexados.

## 🎈 A NIVEL DE TIPOS DE DATOS <a name="a-nivel-de-tipos-de-datos"></a>

- Para cadenas de caracteres se utilizará nvarchar.
- Para fechas se utilizará nvarchar(10) y con el formato aaaa-mm-dd
- Para horas se utilizará nvarchar(5) y con el formato HH:mm
- Estampa de tiempo simple nvarchar(8) y con el formato HH:mm:ss
- Bigint para estampa de tiempo completa.
- Para tipo de datos booleanos es bit (La sugerencia es no usarlo a menos que el dato a guardar indique que no tendrá cambios, ej sexo).
- Para textos largos se usará “nvarchar(MAX)”.
- Paro todos los datos de tipo decimal se usará float con precisión habilitada o la precisión que viene por defecto.
- Para cualquier cosa menor al 127, se utiliza tinyint, si en un futuro se requiere, se puede cambiar por el entero completo o bigint.
- Evita guardar los archivos en la base de datos, trata de guardar solo las rutas, en caso extraordinario de requerir un binario, el tipo de dato seria varbinary(max).

## ⛏️ SEGURIDAD <a name = "seguridad"></a>

- Para conectar un sistema, crear un “usuario funcional” que solo tenga privilegios de SELECT, INSERT, UPDATE, DELETE, SESSION para un esquema que va a utilizar, QUE NO TENGA darle privilegios de DROP y/o GRANT.
- Limitar el privilegio al mínimo necesario para acceso y funciones a los usuarios de base de datos.
- Llevar un control de versiones de la base de datos.
- Para todo cambio en la base, también se debe de actualizar el diagrama de la base de datos.
- Bloquear el acceso a la base de datos a través del firewall.
- Realizar tareas de administración remotas utilizando una VPN.
- Deshabilitar el usuario súper administrador, sa, root o toor.
- Habilitar la encriptación (SSL) de las base de datos y de la conexión. O en su defecto usa un túnel SSH.
- Para almacenar los password de los usuarios utiliza métodos de hasheo a nivel aplicación(vía lenguaje de programación) en vez de los algoritmos que proporciona la base de datos.
- Antes de realizar un cambio importante a la base de datos, realizar un backup.
- Realizar backups periódicamente. Puedes programar un backup automático para que se ejecute cada determinado tiempo.
- Todos los password deberán de ser almacenados vía hash superior o igual a RSA-512, NO USES ningún algoritmo menor ej (MD5 ó SHA-256), ya son obsoletos e inseguros.
- Si se va a almacenar datos sensibles como puede ser un numero de tarjeta se deberá de almacenar de manera encriptada y deberá de ser desencriptada por la aplicación.


## ✍️ FUNCIONALIDAD <a name = "funcionalidad"></a>

- Evitar el uso de procedimientos, funciones, vistas, triggers.
- Evitar uso de *.
- Habilitar el cache para consultas.
- Utilizar instrucciones estándar de SQL.
- Evitar guardar caracteres extraños en los campos ej. ‘, /, //, &, ?, |, °, ¬, @, ↓, ♂, etc…
