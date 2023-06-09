package Beans;
public class ClientesBeans {
    private int ID_CLIENTE;
    private String NOM_CLIENTE;
    private String APE_CLIENTE;
    private String CORRE_CLIENTE;
    private String PASS_CLIENTE;
    public ClientesBeans(int ID_CLIENTE, String NOM_CLIENTE, String APE_CLIENTE, String CORRE_CLIENTE, String PASS_CLIENTE) {
        this.ID_CLIENTE = ID_CLIENTE;
        this.NOM_CLIENTE = NOM_CLIENTE;
        this.APE_CLIENTE = APE_CLIENTE;
        this.CORRE_CLIENTE = CORRE_CLIENTE;
        this.PASS_CLIENTE = PASS_CLIENTE;
    }
    public int getID_CLIENTE() {
        return ID_CLIENTE;
    }

    public void setID_CLIENTE(int ID_CLIENTE) {
        this.ID_CLIENTE = ID_CLIENTE;
    }

    public String getNOM_CLIENTE() {
        return NOM_CLIENTE;
    }

    public void setNOM_CLIENTE(String NOM_CLIENTE) {
        this.NOM_CLIENTE = NOM_CLIENTE;
    }

    public String getAPE_CLIENTE() {
        return APE_CLIENTE;
    }

    public void setAPE_CLIENTE(String APE_CLIENTE) {
        this.APE_CLIENTE = APE_CLIENTE;
    }

    public String getCORRE_CLIENTE() {
        return CORRE_CLIENTE;
    }

    public void setCORRE_CLIENTE(String CORRE_CLIENTE) {
        this.CORRE_CLIENTE = CORRE_CLIENTE;
    }

    public String getPASS_CLIENTE() {
        return PASS_CLIENTE;
    }

    public void setPASS_CLIENTE(String PASS_CLIENTE) {
        this.PASS_CLIENTE = PASS_CLIENTE;
    }
    
}