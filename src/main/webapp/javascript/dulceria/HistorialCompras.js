async function FindAllCompras() {

    const Baseurl = 'http://localhost:8080/MundoCine/Dulceria';
    const userId = document.getElementById('userLogged')?.getAttribute('data-user');
    const url = `${Baseurl}?compra=0&userId=${userId}`;

    try {
        const response = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        });

        if (!response.ok) {
            throw new Error('Network response was not ok');
        }

        const data = await response.json();
        console.log(data); //para verificar el resultado
        return data;
    } catch (error) {
        console.error('Error:', error);
        return [];
    }

}

async function buildTableCompras(){
    data = await FindAllCompras();
    const table = document.getElementById('Table-Compras').getElementsByTagName('tbody')[0];
    table.innerHTML = '';

    data.forEach(compra => {
        const row = table.insertRow();

        const cellID = row.insertCell();
        cellID.textContent = compra.id;

        const cellLocal = row.insertCell();
        cellLocal.textContent = compra.local.Nombre;
        
        const cellFH = row.insertCell();
        cellFH.textContent = compra.fecha_hora;

        const cellprecioT = row.insertCell();
        cellprecioT.textContent = compra.total;

        const cellBtns = row.insertCell();
        cellBtns.innerHTML = '<button type="button" class="btn btn-dark">\n\
                             <i class="fa-solid fa-circle-info"></i></button>\n\
                             <button type="button" class="btn btn-danger">\n\
                             <i class="fa-solid fa-file-pdf"></i></button>';
    });
}


(function manageTableButtons(){
    // Añadir el event listener para los botones dentro de la tabla
    document.getElementById('Table-Compras').addEventListener('click', function(event) {
              
        if (event.target.tagName === 'BUTTON' || event.target.tagName === 'I') {
        // Encuentra el botón que se ha clickeado
            let button = event.target;
            if (button.tagName === 'I') {
                button = button.parentElement;
            }
            const row = button.closest('tr');
            const idCompra = row.cells[0].textContent;

            if (button.classList.contains('btn-dark')) {
                FindDetalleCompra(idCompra);
            }else if (button.classList.contains('btn-danger')){
                deleteCompra(idCompra);
            }
            
         
        }  
    });
})();


function FindDetalleCompra(idCompra){
    
    const Baseurl = 'http://localhost:8080/MundoCine/Dulceria';
    const userId = document.getElementById('userLogged')?.getAttribute('data-user');
    const url = `${Baseurl}?compra=${idCompra}&userId=${userId}`;
       
    //Funcion realizar la peticion con los datos en JSON
    fetch(url, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(data => {
        if(data.status==="Error"){
            alert(data.message);
        }else{
            console.log(data);
            buildTableDetalleCompra(data);
        }
    })
    .catch(error => console.error('Error:', error));
}


function buildTableDetalleCompra(dataItems) {
    data = dataItems;
    const table = document.getElementById('Table-DetalleCompra').getElementsByTagName('tbody')[0];
    table.innerHTML = '';

    data.forEach(item => {
        const row = table.insertRow();

        const cell_ID = row.insertCell();
        cell_ID.textContent = item.id;
        
        const cellProducto = row.insertCell();
        cellProducto.textContent = item.producto.nombre;
        
        const cellCant = row.insertCell();
        cellCant.textContent = item.cantidad;
        
        const cellSubT = row.insertCell();
        cellSubT.textContent = item.subtotal;

    });
}

function deleteCompra(idCompra){
    //Hacer un DELETE al Dulceria ...
        // Definimos la ruta del Servlet al que se hace la peticion
    const Baseurl = 'http://localhost:8080/MundoCine/Dulceria';
    const url = `${Baseurl}?compra=${idCompra}`;   
    
    //Funcion realizar la peticion con los datos en JSON
    fetch(url, {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(data => {
        if(data.status==="Error"){
            alert(data.message);
        }else{
            console.log(data);
            buildTableCompras();
        }
    })
    .catch(error => console.error('Error:', error));
    
}

