package Beans;

public class ProveedorBeans {
    private int cod_proveedor;
    private String descripcion;
    private String direccion;
    private int telefono;
    public ProveedorBeans(int cod_proveedor, String descripcion, String direccion, int telefono) {
        this.cod_proveedor = cod_proveedor;
        this.descripcion = descripcion;
        this.telefono = telefono;
        this.direccion = direccion;
    }

    public int getCod_proveedor() {
        return cod_proveedor;
    }

    public void setCod_proveedor(int cod_proveedor) {
        this.cod_proveedor = cod_proveedor;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

  
}


