
package modelo.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;


public class Compra {
    private int id;
    private Customer customer;
    private Locales local;
    private LocalDateTime fecha_hora;
    private BigDecimal total;
    private List<ItemCompra> items;

    public Compra(int id, Customer customer, Locales local, LocalDateTime fecha_hora, BigDecimal total) {
        this.id = id;
        this.customer = customer;
        this.local = local;
        this.fecha_hora = fecha_hora;
        this.total = total;
    }

    public Compra(int id, Locales local, LocalDateTime fecha_hora, BigDecimal total) {
        this.id = id;
        this.local = local;
        this.fecha_hora = fecha_hora;
        this.total = total;
    }

    public Compra(Customer customer, Locales local, LocalDateTime fecha_hora, BigDecimal total, List<ItemCompra> items) {
        this.customer = customer;
        this.local = local;
        this.fecha_hora = fecha_hora;
        this.total = total;
        this.items = items;
    }
    
    

    
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Locales getLocal() {
        return local;
    }

    public void setLocal(Locales local) {
        this.local = local;
    }

    public LocalDateTime getFecha_hora() {
        return fecha_hora;
    }

    public void setFecha_hora(LocalDateTime fecha_hora) {
        this.fecha_hora = fecha_hora;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public List<ItemCompra> getItems() {
        return items;
    }

    public void setItems(List<ItemCompra> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "Compra{" + "id=" + id + ", customer=" + customer+",\n"
                + "local=" + local + ",\n fecha_hora=" + fecha_hora+",\n"
                + "total=" + total + ",\n "
                + "items= [\n" + items + "]}";
    }
    
    
    
}
