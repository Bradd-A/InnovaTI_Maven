
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Utils.ConexionDB"%>
<%
    String M1 = "Select count(*) from boleta where MONTH(FECHA_COMPRA)=1";
    String M2 = "Select count(*) from boleta where MONTH(FECHA_COMPRA)=2";
    String M3 = "Select count(*) from boleta where MONTH(FECHA_COMPRA)=3";
    String M4 = "Select count(*) from boleta where MONTH(FECHA_COMPRA)=4";
    String M5 = "Select count(*) from boleta where MONTH(FECHA_COMPRA)=5";
    String M6 = "Select count(*) from boleta where MONTH(FECHA_COMPRA)=6";
    String M7 = "Select count(*) from boleta where MONTH(FECHA_COMPRA)=7";
    String M8 = "Select count(*) from boleta where MONTH(FECHA_COMPRA)=8";
    String M9 = "Select count(*) from boleta where MONTH(FECHA_COMPRA)=9";
    String M10 = "Select count(*) from boleta where MONTH(FECHA_COMPRA)=10";
    String M11 = "Select count(*) from boleta where MONTH(FECHA_COMPRA)=11";
    String M12 = "Select count(*) from boleta where MONTH(FECHA_COMPRA)=12";
    PreparedStatement AD1 = ConexionDB.getConexion().prepareStatement(M1);
    PreparedStatement AD2 = ConexionDB.getConexion().prepareStatement(M2);
    PreparedStatement AD3 = ConexionDB.getConexion().prepareStatement(M3);
    PreparedStatement AD4 = ConexionDB.getConexion().prepareStatement(M4);
    PreparedStatement AD5 = ConexionDB.getConexion().prepareStatement(M5);
    PreparedStatement AD6 = ConexionDB.getConexion().prepareStatement(M6);
    PreparedStatement AD7 = ConexionDB.getConexion().prepareStatement(M7);
    PreparedStatement AD8 = ConexionDB.getConexion().prepareStatement(M8);
    PreparedStatement AD9 = ConexionDB.getConexion().prepareStatement(M9);
    PreparedStatement AD10 = ConexionDB.getConexion().prepareStatement(M10);
    PreparedStatement AD11 = ConexionDB.getConexion().prepareStatement(M11);
    PreparedStatement AD12 = ConexionDB.getConexion().prepareStatement(M12);
    ResultSet AC1 = AD1.executeQuery();
    ResultSet AC2 = AD2.executeQuery();
    ResultSet AC3 = AD3.executeQuery();
    ResultSet AC4 = AD4.executeQuery();
    ResultSet AC5 = AD5.executeQuery();
    ResultSet AC6 = AD6.executeQuery();
    ResultSet AC7 = AD7.executeQuery();
    ResultSet AC8 = AD8.executeQuery();
    ResultSet AC9 = AD9.executeQuery();
    ResultSet AC10 = AD10.executeQuery();
    ResultSet AC11 = AD11.executeQuery();
    ResultSet AC12 = AD12.executeQuery();
    int ccant1;
    int ccant2;
    int ccant3;
    int ccant4;
    int ccant5;
    int ccant6;
    int ccant7;
    int ccant8;
    int ccant9;
    int ccant10;
    int ccant11;
    int ccant12;
    if (AC1.next()) {
        ccant1 = AC1.getInt(1);
    } else {
        ccant1 = 0;
    }
    if (AC2.next()) {
        ccant2 = AC2.getInt(1);
    } else {
        ccant2 = 0;
    }
    if (AC3.next()) {
        ccant3 = AC3.getInt(1);
    } else {
        ccant3 = 0;
    }
    if (AC4.next()) {
        ccant4 = AC4.getInt(1);
    } else {
        ccant4 = 0;
    }
    if (AC5.next()) {
        ccant5 = AC5.getInt(1);
    } else {
        ccant5 = 0;
    }
    if (AC6.next()) {
        ccant6 = AC6.getInt(1);
    } else {
        ccant6 = 0;
    }
    if (AC7.next()) {
        ccant7 = AC7.getInt(1);
    } else {
        ccant7 = 0;
    }
    if (AC8.next()) {
        ccant8 = AC8.getInt(1);
    } else {
        ccant8 = 0;
    }
    if (AC9.next()) {
        ccant9 = AC9.getInt(1);
    } else {
        ccant9 = 0;
    }
    if (AC10.next()) {
        ccant10 = AC10.getInt(1);
    } else {
        ccant10 = 0;
    }
    if (AC11.next()) {
        ccant11 = AC11.getInt(1);
    } else {
        ccant11 = 0;
    }
    if (AC12.next()) {
        ccant12 = AC12.getInt(1);
    } else {
        ccant12 = 0;
    }
%>
<script>
    const ctx1 = document.getElementById('myChart2').getContext('2d');
    const myChart2 = new Chart(ctx1, {
        type: 'line',
        data: {
            labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Setiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            datasets: [{
                    label: '# de ventas por cada mes',
                    data: [<%=ccant1%>, <%=ccant2%>, <%=ccant3%>, <%=ccant4%>, <%=ccant5%>, <%=ccant6%>,<%=ccant7%>, <%=ccant8%>, <%=ccant9%>, <%=ccant10%>, <%=ccant11%>, <%=ccant12%>],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 50, 150, 0.2)',
                        'rgba(54, 61, 14, 0.2)',
                        'rgba(255, 165, 90, 0.2)',
                        'rgba(75, 43, 200, 0.2)',
                        'rgba(153, 150, 200, 0.2)',
                        'rgba(120, 180, 74, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(255, 50, 150, 1)',
                        'rgba(54, 61, 14, 1)',
                        'rgba(255, 165, 90, 1)',
                        'rgba(75, 43, 200, 1)',
                        'rgba(153, 150, 200, 1)',
                        'rgba(120, 180, 74, 1)'
                    ],
                    borderWidth: 1
                }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script> 