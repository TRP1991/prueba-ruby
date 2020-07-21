def request1(url_requested,api_key)
    require "uri"
    require "net/http"
    require "json"
    require 'openssl' 

#Metodo API
    url = URI("#{url_requested}#{api_key}")
    https = Net::HTTP.new(url.host, url.port);    
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_PEER
    request = Net::HTTP::Get.new(url)        
    #Captura de respuesta
    response = https.request(request)
    #Respuesta JSON
    body=JSON.parse response.read_body
end

    #captura de API y llamado metodo request1 
    body=request1("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&api_key=", "IUjbbtYHhBzj7GgoRv6WrLD1VA4ras04UZ6BxcK7")
    def build_web_page(body)
        imgs=[]
            10.times do |x|
                imgs<< body["photos"][x]["img_src"]
            end

            File.open("gallery.html", "w") do |file|
                file.write(
            
        '<!DOCTYPE html>
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
        
        <div class="container ">
          <h4 class="subtitle text-dark text-center font-weight-bold">MARS ROVERS IMAGE GALLERY</h4>
          <h4 class="text-dark text-center font-weight-bold ">Prueba - Introducción a la programación con Ruby</h4>
            <div class="row">')

            lines=imgs.length
            lines.times do |i|
                file.write("<div class='col-md-4 imagen'><img src='#{imgs[i]}' class='img-fluid'></div>\n")
                end

        file.write(   '</div>
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
        <!--Close Footer-->'
                            
            
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