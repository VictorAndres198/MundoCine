//Declaraciones para ambos Sliders
const itemsPerView = 6; // Número de elementos visibles a la vez
const itemWidth = 1256.25; // Ancho del contenedor (185.3+24.1)*6 = 1256.4

//Parte que se encarga de la lógica del slider de Cartelera
const moviescartelera = document.querySelectorAll(".movies-cartelera");
let countercartelera = 0;//Contador para la cartelera de peliculas, para el slider
const totalItemsCartelera = moviescartelera.length;
const totalMoviesCartelera = Math.ceil(totalItemsCartelera / itemsPerView) - 1; // Redondear hacia arriba y restar 1

function leftcartelera() {
    if (countercartelera > 0) {
        countercartelera--;
        scrollcartelera();
    }
}

function rightcartelera() {
    if (countercartelera < totalMoviesCartelera) {
        countercartelera++;
        scrollcartelera();
    }
}

function scrollcartelera() {
    const transformValue = countercartelera * itemWidth;
    document.querySelector(".mp-slider-cartelera").style.transform = `translateX(-${transformValue}px)`;
}

//Parte que se encarga de la lógica del slider de Estrenos
const moviesestrenos = document.querySelectorAll(".movies-estrenos");
let counterestrenos = 0;//Contador para los proximos estrenos de peliculas, para el slider
const totalItemsEstrenos = moviesestrenos.length;
const totalMoviesEstrenos = Math.ceil(totalItemsEstrenos / itemsPerView) - 1; // Redondear hacia arriba y restar 1

function leftestrenos() {
    if (counterestrenos > 0) {
        counterestrenos--;
        scrollestrenos();
    }
}

function rightestrenos() {
    if (counterestrenos < totalMoviesEstrenos) {
        counterestrenos++;
        scrollestrenos();
    }
}

function scrollestrenos() {
    const transformValue = counterestrenos * itemWidth;
    document.querySelector(".mp-slider-estrenos").style.transform = `translateX(-${transformValue}px)`;
}

document.addEventListener('DOMContentLoaded', function() {
    var modal = document.getElementById("ratingModal");
    var span = document.getElementsByClassName("close")[0];

    function openModal(movieId, movieTitle) {
        document.getElementById('movieId').value = movieId;
        document.getElementById('movieTitle').value = movieTitle;
        modal.style.display = "block";
    }

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

document.getElementById('ratingForm').onsubmit = function(event) {
    event.preventDefault();
    console.log('Formulario enviado'); // Depurar
    var movieId = document.getElementById('movieId').value;
    var movieTitle = document.getElementById('movieTitle').value;
    var rating = document.getElementById('rating').value;

    console.log('ID de la película:', movieId);
    console.log('Título de la película:', movieTitle);
    console.log('Calificación:', rating);

    fetch('/MundoCine/SvHome', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `movieId=${encodeURIComponent(movieId)}&movieTitle=${encodeURIComponent(movieTitle)}&rating=${encodeURIComponent(rating)}`
    })
    .then(response => response.json())
    .then(data => {
        console.log('Success:', data);
        modal.style.display = "none";
    })
    .catch((error) => {
        console.error('Error:', error);
    });
};

    document.querySelectorAll('.btn-calification').forEach(button => {
        button.addEventListener('click', function() {
            var movieId = this.getAttribute('data-movie-id');
            var movieTitle = this.getAttribute('data-movie-title');
            openModal(movieId, movieTitle);
        });
    });
});
