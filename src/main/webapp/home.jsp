<%-- 
    Document   : home
    Created on : 19 abr. 2024, 01:53:29
    Author     : Victor
--%>

<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido a Mundo Cine</title>
        <link href="resources/css/home.css" rel="stylesheet" type="text/css"/>     
        <link href="resources/css/piePagina.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/navbar.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <jsp:include page="components/navbar.jsp"/>       
                 
        <!-- DESDE ACÁ INICIA LA PRIMERA SECCIÓN DE LA PÁGINA -->        
        <div style="display: grid; place-items: center">            
            <div class="home-container">
                <div style="height: 32px; width: 100%">
                </div>
                <div class="first-container">
                    <div class="slider-movie">
                        <div class="poster">                            
                        </div>
                        <div class="play-teaser">
                            <div class="player">
                                <svg fill="#FFFFFF" width="78.52px" height="78.55px" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M9.5 15.584V8.416a.5.5 0 01.77-.42l5.576 3.583a.5.5 0 010 .842l-5.576 3.584a.5.5 0 01-.77-.42z"></path><path fill-rule="evenodd" d="M12 2.5a9.5 9.5 0 100 19 9.5 9.5 0 000-19zM1 12C1 5.925 5.925 1 12 1s11 4.925 11 11-4.925 11-11 11S1 18.075 1 12z"></path></g></svg>                            
                            </div>
                            <div style="display: flex; flex-direction: column; width: 100%">
                                <div style="display: flex; flex-direction: row; align-items: end">                                
                                    <div class="movie-name">
                                        Deadpool 3
                                    </div>
                                    <div class="teaser-time">
                                        3:51
                                    </div>
                                </div>
                                <div class="teaser-info">
                                    Mira el Trailer
                                </div> 
                            </div>

                        </div>
                    </div> 

                    <!-- DESDE ACÁ INICIA LA PARTE DE PRÓXIMAMENTE -->                    
                    <div class="container-coming-soon">
                        <div style="font-size: 1.25rem; padding: 4px 0px;
                             color:#16B3D6; font-weight: bold; height: 44px;"
                             >Próximamente</div>

                        <!-- DESDE ACÁ EMPIEZA LAS VISTAS PREVIAS -->

                        <div class="coming-soon">
                            <div class="cs-preview" style="gap: 6px">

                                <div class="cs-p-img">
                                    <img style="height: 100%; width: 88px; object-fit: cover; " src="resources/img/home-proximamente/proximamente1.jpg" alt=""/>
                                </div>

                                <div class="cs-p-teaser">
                                    <div class="cs-p-t-player">
                                        <svg style="margin: 0px 8px 0px 0px" fill="#FFFFFF" width="35px" height="35px" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M9.5 15.584V8.416a.5.5 0 01.77-.42l5.576 3.583a.5.5 0 010 .842l-5.576 3.584a.5.5 0 01-.77-.42z"></path><path fill-rule="evenodd" d="M12 2.5a9.5 9.5 0 100 19 9.5 9.5 0 000-19zM1 12C1 5.925 5.925 1 12 1s11 4.925 11 11-4.925 11-11 11S1 18.075 1 12z"></path></g></svg>                            
                                        <div style="font-size: 0.875rem;color: #B3B3B3;">
                                            4:20
                                        </div>
                                    </div>
                                    <div class="cs-p-t-title">
                                        Arthur
                                    </div>
                                    <div class="cs-p-t-info">
                                        Reparto: Mark Wahlberg, Simu Liu, Juliet Rylance
                                    </div>
                                </div>

                            </div>   

                            <div class="cs-preview" style="gap: 6px">

                                <div class="cs-p-img">
                                    <img style="height: 100%; width: 88px; object-fit: cover; " src="resources/img/home-proximamente/proximamente2.webp" alt=""/>
                                </div>

                                <div class="cs-p-teaser">
                                    <div class="cs-p-t-player">
                                        <svg style="margin: 0px 8px 0px 0px" fill="#FFFFFF" width="35px" height="35px" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M9.5 15.584V8.416a.5.5 0 01.77-.42l5.576 3.583a.5.5 0 010 .842l-5.576 3.584a.5.5 0 01-.77-.42z"></path><path fill-rule="evenodd" d="M12 2.5a9.5 9.5 0 100 19 9.5 9.5 0 000-19zM1 12C1 5.925 5.925 1 12 1s11 4.925 11 11-4.925 11-11 11S1 18.075 1 12z"></path></g></svg>                            
                                        <div style="font-size: 0.875rem;color: #B3B3B3;">
                                            2:46
                                        </div>
                                    </div>   
                                    <div class="cs-p-t-title">
                                        Culpa tuya
                                    </div>
                                    <div class="cs-p-t-info">
                                        Reparto: Nicole Wallace, Gabriel Guevara, Iván Sánchez
                                    </div>
                                </div>

                            </div> 

                            <div class="cs-preview" style="gap: 6px">

                                <div class="cs-p-img">
                                    <img style="height: 100%; width: 88px; object-fit: cover; " src="resources/img/home-proximamente/proximamente3.jpg" alt=""/>
                                </div>

                                <div class="cs-p-teaser">
                                    <div class="cs-p-t-player">
                                        <svg style="margin: 0px 8px 0px 0px" fill="#FFFFFF" width="35px" height="35px" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M9.5 15.584V8.416a.5.5 0 01.77-.42l5.576 3.583a.5.5 0 010 .842l-5.576 3.584a.5.5 0 01-.77-.42z"></path><path fill-rule="evenodd" d="M12 2.5a9.5 9.5 0 100 19 9.5 9.5 0 000-19zM1 12C1 5.925 5.925 1 12 1s11 4.925 11 11-4.925 11-11 11S1 18.075 1 12z"></path></g></svg>                            
                                        <div style="font-size: 0.875rem;color: #B3B3B3;">
                                            3:26
                                        </div>
                                    </div>
                                    <div class="cs-p-t-title">
                                        El reino del planeta de los simios
                                    </div>
                                    <div class="cs-p-t-info">
                                        Reparto: Owen Teague, Freya Allan, Peter Macon
                                    </div>
                                </div>

                            </div> 

                        </div>

                        <div style="height: 52px ;display: flex; place-items: end;">
                            <div class="explore-teasers">
                                Explorar tráileres
                                <svg id="explore-more-teasers-svg" style="height: 24px; width: 24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                                <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                                <g id="SVGRepo_iconCarrier">
                                <path d="M10 16L14 12L10 8" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                </g>                            
                            </div>
                        </div>
                    </div>                    

                </div>


                <!-- DESDE ACÁ INICIA LA SEGUNDA SECCIÓN DE LA PÁGINA, LA LISTA DE ESTRENOS -->

                <div class="movie-list-premiere-container">
                    <div style="display: flex; flex-direction: row;"> 
                        <div style="width: 67%; margin-right: 10px;"> <!-- BG-BLACK ACA -->
                            <div class="premiere-h1">Destacado Hoy</div>
                            <div class="premiere-list">
                                <div style="display: flex; flex-direction: column">
                                    <div style="height: 221.98px; width: 394.64px; position: relative;">
                                        <img style="height: 100%; width: 100%; object-fit: cover;" src="resources/img/home/destacado1.webp" alt="destacados hoy"/>
                                        <div style="color: white;position: absolute; padding: 15px;z-index: 1; bottom: 0; left: 20px;" ></div>
                                        <div class="premiere-c bg-hover-semitransparent">
                                            <svg class="svg" style="pointer-events: none;z-index: 1; width: 32px; height: 32px; padding: 10px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M8 6L21 6.00078M8 12L21 12.0008M8 18L21 18.0007M3 6.5H4V5.5H3V6.5ZM3 12.5H4V11.5H3V12.5ZM3 18.5H4V17.5H3V18.5Z" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
                                            <div style="z-index: 1; color: white; padding: 0px 0px 17px 0px; font-size: 0.875rem">Lista</div>
                                            <div></div>
                                        </div>
                                    </div>                            
                                    <div class="premiere-title" >
                                        <div class="p-tunderline" style="cursor: pointer">
                                            Descubre las películas imprescindibles de abril
                                        </div>
                                        <div class="p-tunderline" style="margin: 8px 0px 0px; color: #4C8DE7; cursor: pointer">
                                            Mira nuestras elecciones
                                        </div>
                                    </div>
                                </div>
                                <div style="display: flex; flex-direction: column">
                                    <div style="height: 221.98px; width: 394.64px; position: relative;">
                                        <img style="height: 100%; width: 100%; object-fit: cover;" src="resources/img/home/destacado2.jpeg" alt="destacados hoy"/>
                                        <div style="color: white;position: absolute; padding: 15px;z-index: 1; bottom: 0; left: 20px;" ></div>
                                        <div class="premiere-c bg-hover-semitransparent">
                                            <svg class="svgf" style="pointer-events: none;z-index: 1; width: 32px; height: 32px; padding: 10px" fill="#FFFFFF" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M20 2H8c-1.103 0-2 .897-2 2v12c0 1.103.897 2 2 2h12c1.103 0 2-.897 2-2V4c0-1.103-.897-2-2-2zM8 16V4h12l.002 12H8z"></path><path d="M4 8H2v12c0 1.103.897 2 2 2h12v-2H4V8z"></path><path d="m12 12-1-1-2 3h10l-4-6z"></path></g></svg>
                                            <div style="z-index: 1; color: white; padding: 0px 0px 17px 0px; font-size: 0.875rem">Imágenes</div>
                                        </div>
                                    </div>
                                    <div class="premiere-title" >
                                        <div class="p-tunderline" style="cursor: pointer">
                                            Explora las imágenes más bellas del mundo del cine.
                                        </div>
                                        <div class="p-tunderline" style="margin: 8px 0px 0px; color: #4C8DE7; cursor: pointer">
                                            Mira la galeria
                                        </div>
                                    </div>
                                </div>
                            </div>       
                        </div>                    
                        <div style="width: 33%"></div>
                    </div>
                </div> 


                <div class="onpremiere">
                    <div class="onpremiere-h1">
                        <div>En cartelera</div>
                        <div class="explore-more-premieremovies-container">
                            <div style="font-size: 0.875rem; color:#4C8DE7; ">Ver todas las películas en cartelera</div>
                            <svg id="explore-more-premieremovies-svg" style="height: 24px; width: 24px; margin: 0px -6px 0px 0px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                            <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                            <g id="SVGRepo_iconCarrier">
                            <path d="M10 16L14 12L10 8" stroke="#4C8DE7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                            </g>   
                        </div>                
                    </div>
                </div>

                <!-- ACÁ INICIA LA PARTE DEL SLIDER -->   
                <div class="mlps-container">   

                    <div class="mlps-header">
                        <div class="mlps-h-b"></div>
                        <div style="padding: 0px 0px 0px 12px">Que ver en el cine ahora</div>
                    </div>

                    <div class="movie-premier-slider">

                        <div class="movies-premier">

                            <div class="mps-img">                           
                                <img src="" alt="">                            
                            </div>

                            <div class="mps-information">
                                <div class="mps-calification"></div>
                                <div class="mps-title"></div>
                                <div class="mps-btn-schedules"></div>
                                <div class="mps-btn-teaser"></div>
                            </div>

                        </div>

                    </div>

                </div>  
                
                <%-- FOOTER --%>
                <jsp:include page="components/footer.jsp"/>
            </div>
        </div>
    </body>
</html>
