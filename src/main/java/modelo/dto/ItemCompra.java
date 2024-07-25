
package modelo.dto;

import java.math.BigDecimal;


public class ItemCompra {
    private int id;
    private ItemDulceria producto;
    private int cantidad;
    private BigDecimal subtotal;

    public ItemCompra(int id, ItemDulceria producto, int cantidad, BigDecimal subtotal) {
        this.id = id;
        this.producto = producto;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }

    public ItemCompra(ItemDulceria producto, int cantidad, BigDecimal subtotal) {
        this.producto = producto;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ItemDulceria getProducto() {
        return producto;
    }

    public void setProducto(ItemDulceria producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    @Override
    public String toString() {
        return "ItemCompra{" + "id=" + id + ", producto=" + producto + ", cantidad=" + cantidad + ", subtotal=" + subtotal + "}\n";
    }
    
    
            
}
