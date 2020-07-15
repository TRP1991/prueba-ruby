=begin 

Prueba - Introducción a la programacióncon Ruby

En este desafío nos conectaremos a la API de la NASA para descargar fotos de los Rovers y filtar
resultados acorde a lo pedido.

Se pide:

1. Crear el método request que reciba una url y el api_key y devuelva el hash con los resultados
    Concatenar la API Key en la url

2. Crear un método llamado buid_web_page que reciba el hash de respuesta con todos los datos
    y construya una página web. Se evaluará la página creada y tiene que tener este formato:

<html>
<head>
</head>
<body>
<ul>
    <li><img src='.../398380645PRCLF0030000CCAM04010L1.PNG'></li>
    <li><img src='.../398381687EDR_F0030000CCAM05010M_.JPG'></li>
</ul>
</body>
</html>

Se revisará la estructura del documento generado.

3. Pregunta bonus: Crear un método photos_count que reciba el hash de respuesta y devuelva
    un nuevo hash con el nombre de la camara y la cantidad de fotos.

=end

def request(url1, key1) #metodo
    require "uri"
    require "net/http"
    require "JSON"

    url = URI ("#{url1} #{key1}") #concatenación

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    body=JSON.parse response.read_body

end

#llamando al método
body = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&api_key=IUjbbtYHhBzj7GgoRv6WrLD1VA4ras04UZ6BxcK7")

