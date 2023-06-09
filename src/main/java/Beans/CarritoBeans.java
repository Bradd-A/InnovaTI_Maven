package Beans;

public class CarritoBeans {
    private int cod;
    private String nom;
    private String imagen;
    private double precio;
    private int cant;

    public CarritoBeans(int cod, String nom, String imagen, double precio, int cant) {
        this.cod = cod;
        this.nom = nom;
        this.imagen = imagen;
        this.precio = precio;
        this.cant = cant;
    }

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }
    
}