(function searchLocals() {

    const baseUrl = 'http://localhost:8080/MundoCine/Dulceria';
    const url = `${baseUrl}?locales=0`;

    // obtenemos select donde insertaremos los locales
    const select = document.getElementById('select-locals');

    //Funcion realizar la peticion con los datos en JSON
    fetch(url, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(data => {
        data.forEach(c => {
            const option = document.createElement('option');
            option.value = c.CodLocal;
            option.textContent = c.Nombre;
            select.appendChild(option);
        });
    })
    .catch(error => console.error('Error:', error));

})();

(function searchProducts() {

    const baseUrl = 'http://localhost:8080/MundoCine/Dulceria';
    const url = `${baseUrl}?productos=0`;
    
    // obtenemos la secciones donde iran los productos segun categoria
    const panelCanchita = document.getElementById('nav-canchita').querySelector('.card-deck');
    const panelBebida = document.getElementById('nav-bebida').querySelector('.card-deck');
    const panelSnack = document.getElementById('nav-snack').querySelector('.card-deck');
  
    //Funcion realizar la peticion con los datos en JSON
    fetch(url, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(data => {
        data.forEach(c => {
            const cod = c.codigo;
            const name = c.nombre;
            const category = c.categoria.nombre;
            const description = c.descripcion;
            const price = c.precio;
            const imgPath = `resources/img/dulceria/${category}/${name}.jpg`;
            
            const htmlContent=`<div class="card border-dark mb-3 w-50 p-3">
            <img class="card-img-top rounded mx-auto d-block w-50 p-3" src="${imgPath}" alt="Card image cap">
            <div class="card-body text-dark">
            <h5 class="card-title product-id-name" value="${cod}">${name}</h5>
            <p class="card-text product-description">${description}</p><br>
            <p class="card-text font-weight-bold product-price">${price}</p>
            </div>
            <div class="card-footer bg-transparent border-primary mb-3 text-center">
            <input type="number" class="product-cant" value="0" min="0"></div></div>`;
            
            const TargetPanel = document.getElementById(`nav-${category}`).querySelector('.card-deck');   
            TargetPanel.innerHTML+=htmlContent;
           
        });
    })
    .catch(error => console.error('Error:', error));

})();



