package Beans;

public class BoletaBeans {
    private int ID_BOLETA;
    private String FECHA_COMPRA;
    private int ID_CLIENTE;
    private String DIRECCION_ENVIO;
    private String REFERENCIA;
    private String METODO_PAGO;
    private int EFECTIVO;

    public BoletaBeans(int ID_BOLETA, String FECHA_COMPRA, int ID_CLIENTE, String DIRECCION_ENVIO, String REFERENCIA, String METODO_PAGO, int EFECTIVO) {
        this.ID_BOLETA = ID_BOLETA;
        this.FECHA_COMPRA = FECHA_COMPRA;
        this.ID_CLIENTE = ID_CLIENTE;
        this.DIRECCION_ENVIO = DIRECCION_ENVIO;
        this.REFERENCIA = REFERENCIA;
        this.METODO_PAGO = METODO_PAGO;
        this.EFECTIVO = EFECTIVO;
    }

    public int getID_BOLETA() {
        return ID_BOLETA;
    }

    public void setID_BOLETA(int ID_BOLETA) {
        this.ID_BOLETA = ID_BOLETA;
    }

    public String getFECHA_COMPRA() {
        return FECHA_COMPRA;
    }

    public void setFECHA_COMPRA(String FECHA_COMPRA) {
        this.FECHA_COMPRA = FECHA_COMPRA;
    }

    public int getID_CLIENTE() {
        return ID_CLIENTE;
    }

    public void setID_CLIENTE(int ID_CLIENTE) {
        this.ID_CLIENTE = ID_CLIENTE;
    }

    public String getDIRECCION_ENVIO() {
        return DIRECCION_ENVIO;
    }

    public void setDIRECCION_ENVIO(String DIRECCION_ENVIO) {
        this.DIRECCION_ENVIO = DIRECCION_ENVIO;
    }

    public String getREFERENCIA() {
        return REFERENCIA;
    }

    public void setREFERENCIA(String REFERENCIA) {
        this.REFERENCIA = REFERENCIA;
    }

    public String getMETODO_PAGO() {
        return METODO_PAGO;
    }

    public void setMETODO_PAGO(String METODO_PAGO) {
        this.METODO_PAGO = METODO_PAGO;
    }

    public int getEFECTIVO() {
        return EFECTIVO;
    }

    public void setEFECTIVO(int EFECTIVO) {
        this.EFECTIVO = EFECTIVO;
    }
    
    
}