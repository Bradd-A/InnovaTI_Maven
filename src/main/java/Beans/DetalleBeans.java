package Beans;
public class DetalleBeans {
    private int ID_DETALLE;
    private int ID_PRODUCTO;
    private int ID_BOLETA;
    private int DET_CANTIDAD;
    private double DET_TOTAL;

    public DetalleBeans(int ID_DETALLE, int ID_PRODUCTO, int ID_BOLETA, int DET_CANTIDAD, double DET_TOTAL) {
        this.ID_DETALLE = ID_DETALLE;
        this.ID_PRODUCTO = ID_PRODUCTO;
        this.ID_BOLETA = ID_BOLETA;
        this.DET_CANTIDAD = DET_CANTIDAD;
        this.DET_TOTAL = DET_TOTAL;
    }

    public int getID_DETALLE() {
        return ID_DETALLE;
    }

    public void setID_DETALLE(int ID_DETALLE) {
        this.ID_DETALLE = ID_DETALLE;
    }

    public int getID_PRODUCTO() {
        return ID_PRODUCTO;
    }

    public void setID_PRODUCTO(int ID_PRODUCTO) {
        this.ID_PRODUCTO = ID_PRODUCTO;
    }

    public int getID_BOLETA() {
        return ID_BOLETA;
    }

    public void setID_BOLETA(int ID_BOLETA) {
        this.ID_BOLETA = ID_BOLETA;
    }

    public int getDET_CANTIDAD() {
        return DET_CANTIDAD;
    }

    public void setDET_CANTIDAD(int DET_CANTIDAD) {
        this.DET_CANTIDAD = DET_CANTIDAD;
    }

    public double getDET_TOTAL() {
        return DET_TOTAL;
    }

    public void setDET_TOTAL(double DET_TOTAL) {
        this.DET_TOTAL = DET_TOTAL;
    }
    
}
