package Beans;
public class ProductosBeans {
    private int ID_PRODUCTO;
    private String NOM_PROD;
    private String DESCRIP_PROD;
    private int ID_CATEGORIA;
    private int ID_PROVEEDOR;
    private double PRECIO_UNIT;
    private int ESTADO;
    private int STOCK;
    private String IMAGEN;

    public ProductosBeans(int ID_PRODUCTO, String NOM_PROD, String DESCRIP_PROD, int ID_CATEGORIA, int ID_PROVEEDOR, double PRECIO_UNIT, int ESTADO, int STOCK, String IMAGEN) {
        this.ID_PRODUCTO = ID_PRODUCTO;
        this.NOM_PROD = NOM_PROD;
        this.DESCRIP_PROD = DESCRIP_PROD;
        this.ID_CATEGORIA = ID_CATEGORIA;
        this.ID_PROVEEDOR = ID_PROVEEDOR;
        this.PRECIO_UNIT = PRECIO_UNIT;
        this.ESTADO = ESTADO;
        this.STOCK = STOCK;
        this.IMAGEN = IMAGEN;
    }

    public int getID_PRODUCTO() {
        return ID_PRODUCTO;
    }

    public void setID_PRODUCTO(int ID_PRODUCTO) {
        this.ID_PRODUCTO = ID_PRODUCTO;
    }

    public String getNOM_PROD() {
        return NOM_PROD;
    }

    public void setNOM_PROD(String NOM_PROD) {
        this.NOM_PROD = NOM_PROD;
    }

    public String getDESCRIP_PROD() {
        return DESCRIP_PROD;
    }

    public void setDESCRIP_PROD(String DESCRIP_PROD) {
        this.DESCRIP_PROD = DESCRIP_PROD;
    }

    public int getID_CATEGORIA() {
        return ID_CATEGORIA;
    }

    public void setID_CATEGORIA(int ID_CATEGORIA) {
        this.ID_CATEGORIA = ID_CATEGORIA;
    }

    public int getID_PROVEEDOR() {
        return ID_PROVEEDOR;
    }

    public void setID_PROVEEDOR(int ID_PROVEEDOR) {
        this.ID_PROVEEDOR = ID_PROVEEDOR;
    }

    public double getPRECIO_UNIT() {
        return PRECIO_UNIT;
    }

    public void setPRECIO_UNIT(double PRECIO_UNIT) {
        this.PRECIO_UNIT = PRECIO_UNIT;
    }

    public int getESTADO() {
        return ESTADO;
    }

    public void setESTADO(int ESTADO) {
        this.ESTADO = ESTADO;
    }

    public int getSTOCK() {
        return STOCK;
    }

    public void setSTOCK(int STOCK) {
        this.STOCK = STOCK;
    }

    public String getIMAGEN() {
        return IMAGEN;
    }

    public void setIMAGEN(String IMAGEN) {
        this.IMAGEN = IMAGEN;
    }
    
}