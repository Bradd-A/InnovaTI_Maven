package Beans;
public class CategoriaBeans {
    private int ID_CATEGORIA;
    private String NOM_CAT;
    private String DESCRIPCION;

    public CategoriaBeans(int ID_CATEGORIA, String NOM_CAT, String DESCRIPCION) {
        this.ID_CATEGORIA = ID_CATEGORIA;
        this.NOM_CAT = NOM_CAT;
        this.DESCRIPCION = DESCRIPCION;
    }

    public int getID_CATEGORIA() {
        return ID_CATEGORIA;
    }

    public void setID_CATEGORIA(int ID_CATEGORIA) {
        this.ID_CATEGORIA = ID_CATEGORIA;
    }

    public String getNOM_CAT() {
        return NOM_CAT;
    }

    public void setNOM_CAT(String NOM_CAT) {
        this.NOM_CAT = NOM_CAT;
    }

    public String getDESCRIPCION() {
        return DESCRIPCION;
    }

    public void setDESCRIPCION(String DESCRIPCION) {
        this.DESCRIPCION = DESCRIPCION;
    }
    
}