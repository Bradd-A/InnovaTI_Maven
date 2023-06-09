package Beans;
public class ConsultaBeans {
    private int ID_CONSULTA;
    private String NOM_CONSUL;
    private String CORREO_CONSUL;
    private String DESCRIP_CONSULTA;
    
    public ConsultaBeans(int ID_CONSULTA, String NOM_CONSUL, String CORREO_CONSUL, String DESCRIP_CONSULTA) {
        this.ID_CONSULTA = ID_CONSULTA;
        this.NOM_CONSUL = NOM_CONSUL;
        this.CORREO_CONSUL = CORREO_CONSUL;
        this.DESCRIP_CONSULTA = DESCRIP_CONSULTA;
    }
    public int getID_CONSULTA() {
        return ID_CONSULTA;
    }

    public void setID_CONSULTA(int ID_CONSULTA) {
        this.ID_CONSULTA = ID_CONSULTA;
    }

    public String getNOM_CONSUL() {
        return NOM_CONSUL;
    }

    public void setNOM_CONSUL(String NOM_CONSUL) {
        this.NOM_CONSUL = NOM_CONSUL;
    }

    public String getCORREO_CONSUL() {
        return CORREO_CONSUL;
    }

    public void setCORREO_CONSUL(String CORREO_CONSUL) {
        this.CORREO_CONSUL = CORREO_CONSUL;
    }

    public String getDESCRIP_CONSULTA() {
        return DESCRIP_CONSULTA;
    }

    public void setDESCRIP_CONSULTA(String DESCRIP_CONSULTA) {
        this.DESCRIP_CONSULTA = DESCRIP_CONSULTA;
    }
    
}
