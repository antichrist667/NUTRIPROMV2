# Utiliza una imagen base oficial de Python
FROM python:3.10-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos necesarios a la imagen del contenedor
COPY . /app

# Instala las dependencias del sistema necesarias
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Crea un archivo requirements.txt con los paquetes y versiones específicos
RUN echo "
aniso8601==7.0.0
anyio==4.4.0
blinker==1.8.2
click==8.1.7
colorama==0.4.6
et-xmlfile==1.1.0
Flask==3.0.3
Flask-Cors==4.0.1
Flask-GraphQL==2.0.1
git-filter-repo==2.45.0
graphene==2.1.9
graphene-file-upload==1.3.0
graphene-sqlalchemy==2.3.0
graphql-core==2.2.1
graphql-relay==2.0.1
graphql-server-core==1.1.3
greenlet==3.0.3
idna==3.7
itsdangerous==2.2.0
Jinja2==3.1.4
MarkupSafe==2.1.5
MouseInfo==0.1.3
mysql-connector-python==9.0.0
numpy==1.24.1
openpyxl==3.0.10
pandas==1.5.3
promise==2.3
PyAutoGUI==0.9.53
PyGetWindow==0.0.9
PyMsgBox==1.0.9
pyperclip==1.8.2
PyRect==0.2.0
PyScreeze==0.1.28
python-dateutil==2.8.2
python-dotenv==1.0.1
pytweening==1.0.4
pytz==2022.7.1
Rx==1.6.3
singledispatch==3.7.0
six==1.16.0
sniffio==1.3.1
SQLAlchemy==1.4.53
starlette==0.38.2
typing_extensions==4.12.2
Werkzeug==3.0.3
" > requirements.txt

# Instala las dependencias de Python especificadas en requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expone el puerto necesario
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["python", "app/prediction2.py", "--host=0.0.0.0", "--port=8080"]
