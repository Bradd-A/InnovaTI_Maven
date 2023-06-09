
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Utils.ConexionDB"%>
<%
    String C1 = "select SUM(DET_CANTIDAD) as Ventas_Producto from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join producto as p on d.ID_PRODUCTO=p.ID_PRODUCTO WHERE year(FECHA_COMPRA)=2021 GROUP BY p.ID_PRODUCTO ORDER BY SUM(DET_CANTIDAD) DESC LIMIT 1 ;";
    String C2 = "select SUM(DET_CANTIDAD) as Ventas_Producto from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join producto as p on d.ID_PRODUCTO=p.ID_PRODUCTO WHERE year(FECHA_COMPRA)=2021 GROUP BY p.ID_PRODUCTO ORDER BY SUM(DET_CANTIDAD) DESC lIMIT 1,1";
    String C3 = "select SUM(DET_CANTIDAD) as Ventas_Producto from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join producto as p on d.ID_PRODUCTO=p.ID_PRODUCTO WHERE year(FECHA_COMPRA)=2021 GROUP BY p.ID_PRODUCTO ORDER BY SUM(DET_CANTIDAD) DESC lIMIT 2,1";
    String C4 = "select SUM(DET_CANTIDAD) as Ventas_Producto from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join producto as p on d.ID_PRODUCTO=p.ID_PRODUCTO WHERE year(FECHA_COMPRA)=2021 GROUP BY p.ID_PRODUCTO ORDER BY SUM(DET_CANTIDAD) DESC lIMIT 3,1";
    String C5 = "select SUM(DET_CANTIDAD) as Ventas_Producto from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join producto as p on d.ID_PRODUCTO=p.ID_PRODUCTO WHERE year(FECHA_COMPRA)=2021 GROUP BY p.ID_PRODUCTO ORDER BY SUM(DET_CANTIDAD) DESC lIMIT 4,1";
    String C6 = "select NOM_PROD from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join producto as p on d.ID_PRODUCTO=p.ID_PRODUCTO WHERE year(FECHA_COMPRA)=2021 GROUP BY p.ID_PRODUCTO ORDER BY SUM(DET_CANTIDAD) DESC LIMIT 1";
    String C7 = "select NOM_PROD from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join producto as p on d.ID_PRODUCTO=p.ID_PRODUCTO WHERE year(FECHA_COMPRA)=2021 GROUP BY p.ID_PRODUCTO ORDER BY SUM(DET_CANTIDAD) DESC LIMIT 1,1";
    String C8 = "select NOM_PROD from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join producto as p on d.ID_PRODUCTO=p.ID_PRODUCTO WHERE year(FECHA_COMPRA)=2021 GROUP BY p.ID_PRODUCTO ORDER BY SUM(DET_CANTIDAD) DESC LIMIT 2,1";
    String C9 = "select NOM_PROD from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join producto as p on d.ID_PRODUCTO=p.ID_PRODUCTO WHERE year(FECHA_COMPRA)=2021 GROUP BY p.ID_PRODUCTO ORDER BY SUM(DET_CANTIDAD) DESC LIMIT 3,1";
    String C10 = "select NOM_PROD from boleta as b INNER JOIN detalle_boleta as d on b.ID_BOLETA=d.ID_BOLETA inner join producto as p on d.ID_PRODUCTO=p.ID_PRODUCTO WHERE year(FECHA_COMPRA)=2021 GROUP BY p.ID_PRODUCTO ORDER BY SUM(DET_CANTIDAD) DESC LIMIT 4,1";
    PreparedStatement AA1 = ConexionDB.getConexion().prepareStatement(C1);
    PreparedStatement AA2 = ConexionDB.getConexion().prepareStatement(C2);
    PreparedStatement AA3 = ConexionDB.getConexion().prepareStatement(C3);
    PreparedStatement AA4 = ConexionDB.getConexion().prepareStatement(C4);
    PreparedStatement AA5 = ConexionDB.getConexion().prepareStatement(C5);
    PreparedStatement AA6 = ConexionDB.getConexion().prepareStatement(C6);
    PreparedStatement AA7 = ConexionDB.getConexion().prepareStatement(C7);
    PreparedStatement AA8 = ConexionDB.getConexion().prepareStatement(C8);
    PreparedStatement AA9 = ConexionDB.getConexion().prepareStatement(C9);
    PreparedStatement AA10 = ConexionDB.getConexion().prepareStatement(C10);
    ResultSet BB1 = AA1.executeQuery();
    ResultSet BB2 = AA2.executeQuery();
    ResultSet BB3 = AA3.executeQuery();
    ResultSet BB4 = AA4.executeQuery();
    ResultSet BB5 = AA5.executeQuery();
    ResultSet BB6 = AA6.executeQuery();
    ResultSet BB7 = AA7.executeQuery();
    ResultSet BB8 = AA8.executeQuery();
    ResultSet BB9 = AA9.executeQuery();
    ResultSet BB10 = AA10.executeQuery();
    int t1;
    int t2;
    int t3;
    int t4;
    int t5;
    String t6;
    String t7;
    String t8;
    String t9;
    String t10;
    if (BB1.next()) {
        t1 = BB1.getInt(1);
    } else {
        t1 = 0;
    }
    if (BB2.next()) {
        t2 = BB2.getInt(1);
    } else {
        t2 = 0;
    }
    if (BB3.next()) {
        t3 = BB3.getInt(1);
    } else {
        t3 = 0;
    }
    if (BB4.next()) {
        t4 = BB4.getInt(1);
    } else {
        t4 = 0;
    }
    if (BB5.next()) {
        t5 = BB5.getInt(1);
    } else {
        t5 = 0;
    }
    if (BB6.next()) {
        t6 = BB6.getString(1);
    } else {
        t6 = "";
    }
    if (BB7.next()) {
        t7 = BB7.getString(1);
    } else {
        t7 = "";
    }
    if (BB8.next()) {
        t8 = BB8.getString(1);
    } else {
        t8 = "";
    }
    if (BB9.next()) {
        t9 = BB9.getString(1);
    } else {
        t9 = "";
    }
    if (BB10.next()) {
        t10 = BB10.getString(1);
    } else {
        t10 = "";
    }
%>
<script>
    const ctx2 = document.getElementById('myChart3').getContext('2d');
    const myChart3 = new Chart(ctx2, {
        type: 'pie',
        data: {
            labels: ['<%=t6%>', '<%=t7%>', '<%=t8%>', '<%=t9%>', '<%=t10%>'],
            datasets: [{
                    label: '# Top productos',
                    data: [<%=t1%>, <%=t2%>, <%=t3%>, <%=t4%>, <%=t5%>],
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