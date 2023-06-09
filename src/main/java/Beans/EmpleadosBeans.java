package Beans;
public class EmpleadosBeans {
    private int ID_EMPLEADO;
    private String NOM_EMPLE;
    private String APE_EMPLE;
    private int ROL;
    private String CORRE_EMPLE;
    private String PASS_EMPLE;
    
    public EmpleadosBeans(int ID_EMPLEADO, String NOM_EMPLE, String APE_EMPLE, int ROL, String CORRE_EMPLE, String PASS_EMPLE) {
        this.ID_EMPLEADO = ID_EMPLEADO;
        this.NOM_EMPLE = NOM_EMPLE;
        this.APE_EMPLE = APE_EMPLE;
        this.ROL = ROL;
        this.CORRE_EMPLE = CORRE_EMPLE;
        this.PASS_EMPLE = PASS_EMPLE;
    }
    public int getID_EMPLEADO() {
        return ID_EMPLEADO;
    }

    public void setID_EMPLEADO(int ID_EMPLEADO) {
        this.ID_EMPLEADO = ID_EMPLEADO;
    }

    public String getNOM_EMPLE() {
        return NOM_EMPLE;
    }

    public void setNOM_EMPLE(String NOM_EMPLE) {
        this.NOM_EMPLE = NOM_EMPLE;
    }

    public String getAPE_EMPLE() {
        return APE_EMPLE;
    }

    public void setAPE_EMPLE(String APE_EMPLE) {
        this.APE_EMPLE = APE_EMPLE;
    }

    public int getROL() {
        return ROL;
    }

    public void setROL(int ROL) {
        this.ROL = ROL;
    }

    public String getCORRE_EMPLE() {
        return CORRE_EMPLE;
    }

    public void setCORRE_EMPLE(String CORRE_EMPLE) {
        this.CORRE_EMPLE = CORRE_EMPLE;
    }

    public String getPASS_EMPLE() {
        return PASS_EMPLE;
    }

    public void setPASS_EMPLE(String PASS_EMPLE) {
        this.PASS_EMPLE = PASS_EMPLE;
    }
    
}