<%-- 
    Document   : home
    Created on : 19 abr. 2024, 01:53:29
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido a Mundo Cine</title>
        <link href="resources/css/home.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- ESTO ES EL NAVBAR -->
        <div class="navbar">
            <div class="container-options">
                <div class="options">
                    <div style="display: grid; place-items: center; width: 64px; height: 36px">                        
                    <button style='display: flex; place-items: center; background: #16B3D6;
                            font-weight: bold; font-size: 1.5rem; border: transparent;
                            border-radius: 4px; cursor: pointer; height: 32px; padding: 0px 10px;
                            font-size: 1.25rem;'>
                        MundoCine
                    </button>                        
                    </div>
                    <button class="btnnavbar">
                        <div style="display: flex; flex-direction: row; place-items: center; padding: 0px 16px">
                            <img src="resources/img/home-navbar/menu-bars.svg" 
                                 alt="Barras de búsqueda" width="24" height="24"
                                 style="display: grid; place-items: center; padding-right: 10px">
                            Menú
                        </div>
                    </button>
                    <div class="Ccontainer-search">
                        <div class="search">
                            <button class="buttonall" style="display: flex; flex-direction: row; place-items: center">                                
                                Todo
                                <img src="resources/img/home-navbar/triangledown-btn.svg" 
                                 alt="Triangle Down Pointer" width="8" height="8"
                                 style="display: grid; place-items: center; padding-left: 10px">
                            </button>
                            <input type="text" class="searcher" placeholder="Buscar en MundoCine">
                            <button class="buttonlens">                                
                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#757575"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" id="lupa"/></svg>
                            </button>
                        </div>
                    </div>
                    <button class="btnnavbar" style="padding: 0px 16px">
                        Iniciar sesión
                    </button>
                </div>
            </div>
        </div>
        
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
                    <div style="width: 67%; margin-right: 10px; background: blue">
                        <div class="premiere-h1">Destacado Hoy</div>
                        <div class="premiere-list">
                            <div style="background: black; height: 221.98px; width: 394.64px;">
                                
                            </div>
                            <div style="background: white; height: 221.98px; width: 394.64px;">
                                
                            </div>
                        </div>
                    </div>
                    
                    <div style="width: 33%"></div>
                </div>
            </div> 
               
            <!-- ====================================================================== -->          
                       
            </div>
        </div>
    </body>
</html>
