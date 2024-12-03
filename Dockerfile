# Usamos la imagen base de Go con Alpine (una versión ligera de Linux)
FROM golang:alpine

# Establecemos el directorio de trabajo dentro del contenedor a /app
WORKDIR /app

# Copiamos los archivos go.mod y go.sum al contenedor (necesarios para gestionar dependencias)
COPY go.* ./

# Descargamos las dependencias del módulo Go definidas en go.mod
RUN go mod download

# Copiamos el resto de los archivos del proyecto al contenedor
COPY . .

# Construimos la aplicación Go, generando un archivo ejecutable llamado 'main'
RUN go build -o main main.go

# Exponemos el puerto 8080 para que el contenedor pueda aceptar conexiones en este puerto
EXPOSE 8080

# Establecemos el comando por defecto para ejecutar cuando se inicie el contenedor (ejecutar la aplicación Go)
CMD [ "./main" ]
