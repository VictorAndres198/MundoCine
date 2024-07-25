
async function verificarCompra() {
    const local = document.getElementById('compra-content').querySelector('.compra-local').innerText;
    const compra = document.getElementById('compra-total').innerText;
    let compraValida = true;
    let msj='';
    if(local === '---'){
        msj +='Tiene que seleccioanr un local\n';
    }
    if(compra === '0'){
        msj +='Tiene que seleccionar algun producto\n';
    }
    
    const userDni = document.getElementById('user-dni')?.value;
    if(userDni!==undefined){
        const pass = document.getElementById('user-pass').value;
        if(userDni===''){
            msj+='Tiene que introducir su dni\n';
        }
        
        if(pass===''){
            msj+='Tiene que introducir su clave\n';
        }
        
        if(userDni!=='' && pass!==''){
            msj+= await findCustomer(userDni,pass);
        }
  
    }
    
    if(!(msj === '')){
        alert(msj);
        compraValida=false;
    }
    
    return compraValida;
}

async function findCustomer(userDni,pass){
    const Baseurl = 'http://localhost:8080/MundoCine/Dulceria';
    const url = `${Baseurl}?customer=${userDni}&pass=${pass}`;
    try {
       const response = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        });
        const data = await response.json();
        
        if (data.status === "Error") {
            return `El usuario no es valido`;
        } else {
            return '';
        }
        
    } catch (error) {
        console.error('Error:', error);
        return `Error: ${error.message}`;
    }
}

async function realizarCompra() {
    const compraValida = await verificarCompra();
    if (compraValida) {
    
        console.log("Este boton realiza la compra");

        // Definimos la ruta del Servlet al que se hace la peticion
        const url = 'http://localhost:8080/MundoCine/Dulceria';

        //capturmos los datos del Frm

        //OBTENEMOS LOS ITEMS DE LA COMPRA
        const itemsValue = getTableItems();

        //OBTENEMOS LA COMPRA COMPLETA
        
        let client = document.getElementById('userLogged')?.getAttribute('data-user');
        let typeOrder = 'standard';
        if(client===undefined){ //usuario no logeado
            client = document.getElementById('user-dni').value;;
            typeOrder = 'anonymous';
        }
        
        const localValue = document.getElementById('select-locals').value;
        const totalValue = document.getElementById('compra-total').innerText;

        const compra = {
            cliente: client,
            order: typeOrder,
            local: localValue,
            items: itemsValue,
            total: totalValue
        };


        console.log(compra);
        
        //Funcion realizar la peticion con los datos en JSON
        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(compra)
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === "Error") {
                alert(data.message);
            } else {
                alert(data.message);
            }
        })
        .catch(error => console.error('Error:', error));
        
    }
}

function getTableItems() {
    const table = document.getElementById('compra-content').getElementsByTagName('tbody')[0];
    const rowCount = table.rows.length - 1;
    let items = [];
    for (var i = 0; i < rowCount; i++) {
        const idValue = table.rows[i].querySelector('.item-id').innerText;
        const name = table.rows[i].querySelector('.item-name').innerText;
        const cant = table.rows[i].querySelector('.item-cant').innerText;
        const subtotalValue = table.rows[i].querySelector('.item-subtotal').innerText;

        // Crear un objeto para cada item de la Compra
        const item = {
            id: idValue,
            nombre: name,
            cantidad: cant,
            subtotal: subtotalValue
        };

        // Agregar el objeto al arreglo items
        items.push(item);
    }
    return items;
}