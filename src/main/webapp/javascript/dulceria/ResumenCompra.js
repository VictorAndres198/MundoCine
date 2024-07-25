
function buildResumenCompra(){
    
    //Determinar el local
    const localLabel = document.getElementById('compra-content').querySelector('.compra-local');
    const select = document.getElementById('select-locals');
    const selectLocal = select.options[select.selectedIndex].text;
    localLabel.innerText=selectLocal;
    
    //Determinar resumen de la compra
    let table = document.getElementById('compra-content').getElementsByTagName('tbody')[0];
    let total = 0;
    table.innerHTML='';
    const products = document.querySelectorAll('.card');
    
    for (let i = 0; i < products.length; i++) {
        const productCant = products[i].querySelector('.product-cant').value;
        if (!(productCant==='0')) {
        
            const id = products[i].querySelector('.product-id-name').getAttribute('value');
            const name = products[i].querySelector('.product-id-name').innerText;
            const price = parseFloat(products[i].querySelector('.product-price').innerText);
            const subtotal = price * parseFloat(productCant);
            total+=subtotal;
            
            //Rellenar el resumen de compra
            table.innerHTML+=`<tr><td class="item-id">${id}</td><td class="item-name">${name}</td>
                             <td class="item-cant">${productCant}</td>
                             <td class="item-subtotal">${subtotal}</td></tr>`;
        }
    };
    table.innerHTML+=`<tr><td colspan="3">Precio Total</td><td colspan="1" id="compra-total">${total}</td></tr>`;
 
}

