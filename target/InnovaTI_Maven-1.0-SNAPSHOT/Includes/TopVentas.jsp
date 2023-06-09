
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Utils.ConexionDB"%>
<%
    String F1 = "select count(*) as COMPRAS from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join cliente as p on b.ID_CLIENTE=p.ID_CLIENTE WHERE year(FECHA_COMPRA)=2021 GROUP BY b.ID_CLIENTE ORDER BY count(*) DESC LIMIT 1;";
    String F2 = "select count(*) as COMPRAS from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join cliente as p on b.ID_CLIENTE=p.ID_CLIENTE WHERE year(FECHA_COMPRA)=2021 GROUP BY b.ID_CLIENTE ORDER BY count(*) DESC LIMIT 1,1;";
    String F3 = "select count(*) as COMPRAS from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join cliente as p on b.ID_CLIENTE=p.ID_CLIENTE WHERE year(FECHA_COMPRA)=2021 GROUP BY b.ID_CLIENTE ORDER BY count(*) DESC LIMIT 2,1;";
    String F4 = "select count(*) as COMPRAS from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join cliente as p on b.ID_CLIENTE=p.ID_CLIENTE WHERE year(FECHA_COMPRA)=2021 GROUP BY b.ID_CLIENTE ORDER BY count(*) DESC LIMIT 3,1;";
    String F5 = "select count(*) as COMPRAS from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join cliente as p on b.ID_CLIENTE=p.ID_CLIENTE WHERE year(FECHA_COMPRA)=2021 GROUP BY b.ID_CLIENTE ORDER BY count(*) DESC LIMIT 4,1;";
    String F6 = "select NOM_CLIENTE from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join cliente as p on b.ID_CLIENTE=p.ID_CLIENTE WHERE year(FECHA_COMPRA)=2021 GROUP BY b.ID_CLIENTE ORDER BY count(*) DESC LIMIT 1;";
    String F7 = "select NOM_CLIENTE from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join cliente as p on b.ID_CLIENTE=p.ID_CLIENTE WHERE year(FECHA_COMPRA)=2021 GROUP BY b.ID_CLIENTE ORDER BY count(*) DESC LIMIT 1,1;";
    String F8 = "select NOM_CLIENTE from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join cliente as p on b.ID_CLIENTE=p.ID_CLIENTE WHERE year(FECHA_COMPRA)=2021 GROUP BY b.ID_CLIENTE ORDER BY count(*) DESC LIMIT 2,1;";
    String F9 = "select NOM_CLIENTE from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join cliente as p on b.ID_CLIENTE=p.ID_CLIENTE WHERE year(FECHA_COMPRA)=2021 GROUP BY b.ID_CLIENTE ORDER BY count(*) DESC LIMIT 3,1;";
    String F10 = "select NOM_CLIENTE from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join cliente as p on b.ID_CLIENTE=p.ID_CLIENTE WHERE year(FECHA_COMPRA)=2021 GROUP BY b.ID_CLIENTE ORDER BY count(*) DESC LIMIT 4,1;";
    PreparedStatement AAA1 = ConexionDB.getConexion().prepareStatement(F1);
    PreparedStatement AAA2 = ConexionDB.getConexion().prepareStatement(F2);
    PreparedStatement AAA3 = ConexionDB.getConexion().prepareStatement(F3);
    PreparedStatement AAA4 = ConexionDB.getConexion().prepareStatement(F4);
    PreparedStatement AAA5 = ConexionDB.getConexion().prepareStatement(F5);
    PreparedStatement AAA6 = ConexionDB.getConexion().prepareStatement(F6);
    PreparedStatement AAA7 = ConexionDB.getConexion().prepareStatement(F7);
    PreparedStatement AAA8 = ConexionDB.getConexion().prepareStatement(F8);
    PreparedStatement AAA9 = ConexionDB.getConexion().prepareStatement(F9);
    PreparedStatement AAA10 = ConexionDB.getConexion().prepareStatement(F10);
    ResultSet BBB1 = AAA1.executeQuery();
    ResultSet BBB2 = AAA2.executeQuery();
    ResultSet BBB3 = AAA3.executeQuery();
    ResultSet BBB4 = AAA4.executeQuery();
    ResultSet BBB5 = AAA5.executeQuery();
    ResultSet BBB6 = AAA6.executeQuery();
    ResultSet BBB7 = AAA7.executeQuery();
    ResultSet BBB8 = AAA8.executeQuery();
    ResultSet BBB9 = AAA9.executeQuery();
    ResultSet BBB10 = AAA10.executeQuery();
    int tt1;
    int tt2;
    int tt3;
    int tt4;
    int tt5;
    String tt6;
    String tt7;
    String tt8;
    String tt9;
    String tt10;
    if (BBB1.next()) {
        tt1 = BBB1.getInt(1);
    } else {
        tt1 = 0;
    }
    if (BBB2.next()) {
        tt2 = BBB2.getInt(1);
    } else {
        tt2 = 0;
    }
    if (BBB3.next()) {
        tt3 = BBB3.getInt(1);
    } else {
        tt3 = 0;
    }
    if (BBB4.next()) {
        tt4 = BBB4.getInt(1);
    } else {
        tt4 = 0;
    }
    if (BBB5.next()) {
        tt5 = BBB5.getInt(1);
    } else {
        tt5 = 0;
    }
    if (BBB6.next()) {
        tt6 = BBB6.getString(1);
    } else {
        tt6 = "";
    }
    if (BBB7.next()) {
        tt7 = BBB7.getString(1);
    } else {
        tt7 = "";
    }
    if (BBB8.next()) {
        tt8 = BBB8.getString(1);
    } else {
        tt8 = "";
    }
    if (BBB9.next()) {
        tt9 = BBB9.getString(1);
    } else {
        tt9 = "";
    }
    if (BBB10.next()) {
        tt10 = BBB10.getString(1);
    } else {
        tt10 = "";
    }
%>
<script>
    const ctx3 = document.getElementById('myChart4').getContext('2d');
    const myChart4 = new Chart(ctx3, {
        type: 'doughnut',
        Position: 'left',
        data: {
            labels: ['<%=tt6%>', '<%=tt7%>', '<%=tt8%>', '<%=tt9%>', '<%=tt10%>'],
            datasets: [{
                    label: '# Top Ventas',
                    data: [<%=tt1%>, <%=tt2%>, <%=tt3%>, <%=tt4%>, <%=tt5%>],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)'
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