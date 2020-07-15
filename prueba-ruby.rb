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

def request url1, key1
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

#llamado al método request
body = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&api_key=", "IUjbbtYHhBzj7GgoRv6WrLD1VA4ras04UZ6BxcK7")
def build_web_page (website) #metodo build_we_page que recibe el hash de respuesta
    imgs=[]
    10.times do |x|
        imgs << website["photos"][x]["img_src"]
    end

    File.open("galeria.html", "w") do |file|
        file.write(
        '<!DOCTYPE html> #Comienzo diseño HTML
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Galeria</title>
            <meta name="author" content="Tamara Rubilar Pinilla">
            <meta name="description" content= "Mars Curiosity Image Gallery">
            <meta name="keywords" content="development, website, creator, gallery">

        <!--CSS Boostrap 4.5.0-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <!--Google Fonts-->
        <link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&family=Ubuntu+Condensed&display=swap" rel="stylesheet"> 

        <!--Font Awesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css"
        integrity="sha384UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

        <!--CSS Style-->
        <link rel="stylesheet" href="assets/css/style.css">

        </head>
        <body>

        <!--Open Navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-light fixed-top">
            <div class="container">
            <a class="navbar-brand" href="#">
                <img src="assets/img/tamara-logo.png" alt="Tamara Rubilar Logo">
            </a>
            <buttom class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </buttom>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto menu">
                <li class="nav-item">
                    <a class="nav-link text-dark" href="index.html">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="#requirements">Requerimientos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="#gallery">Galeria</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="#contact">Contacto</a>
                </li>
                </ul>
            </div>
            </div>
        </nav>
        <!--Close Navbar-->

        <!--Open Gallery Section-->
        <section id="gallery">
            <div class="d-none d-md-block">
            <h3 class="title font-weight-bold pt-5 my-5 text-center text-light text-body display-4">GALERIA</h3>
            <hr class="mt-4">
            </div>
        </section>

        <div class="container">
            <h4 class="subtitle text-dark text-center font-weight-bold">MARS ROVERS IMAGE GALLERY</h4>
            <h4 class="text-dark text-center font-weight-bold ">Prueba - Introducción a la programación con Ruby</h4>
            <div class="row">' ) 

            lines=imgs.length
            lines.times do |i|
                File.write("<div class='col-md-4 imagen'><img src='#{imgs[i]}' class='img-fluid'></div>\n")
            end

            
        File.write(  '</div>
        </div>        

        <!--Footer-->
        <section class="tamara">
          <footer class="text-center footer-t">
              <div class="container">
        
                  <!--Open Row-->
                  <div class="row">
                      <div class="col-md-4">
                          <h3 class="font-weight-bold my-4 text-light logo-footer">Estudiante: Tamara Rubilar Pinilla</h3>
                      </div>
        
                      <div class="col-md-8">
                          <a href="https://github.com/" target="_blank" class="text-white px-3 ">
                              <i class="fab fa-github my-3 fa-3x my-3"></i>
                          </a>
        
                          <a href="https://www.linkedin.com/in/tamara-rubilar-pinilla-a3b45318a/" target="_blank"
                              class="text-white px-3">
                              <i class="fab fa-linkedin my-3 fa-3x my-3"></i>
                          </a>
        
                          <a href="https://twitter.com/explore" target="_blank" class="text-white px-3">
                              <i class="fab fa-twitter-square my-3 fa-3x my-3"></i>
                          </a>
        
                          <a href="https://facebook.com/" target="_blank" class="text-white px-3">
                              <i class="fab fa-facebook-square my-3 fa-3x my-3"></i>
                          </a>
                      </div>
                  </div>
                  <!--Close Row-->
              </div>
          </footer>
        </section>
        <!--Close Footer-->
        
        
        <!--Integrations-->
        
        <!--jQuery 3.5.1 sin slim-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        
        <!--Popper JS 1.16.0-->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        
        <!--Bootstrap JS 4.5.0-->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
        
        <!--My Script-->
        <script src="assets/js/script.js"></script>
        </body>
        </html>'

        )
        
    end
end

build_web_page(body)

def photos_count(val)
    camera={}
    camera.store(val["photos"][0]["camera"]["name"],val["photos"][0]["rover"]["total_photos"])

    camera
end

photos_count(body)