
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Utils.ConexionDB"%>
<%
    String D1 = "Select sum(STOCK) from producto where ID_CATEGORIA=1";
    String D2 = "Select sum(STOCK) from producto where ID_CATEGORIA=2";
    String D3 = "Select sum(STOCK) from producto where ID_CATEGORIA=3";
    String D4 = "Select sum(STOCK) from producto where ID_CATEGORIA=4";
    String D5 = "Select sum(STOCK) from producto where ID_CATEGORIA=5";
    String D6 = "Select sum(STOCK) from producto where ID_CATEGORIA=6";
    PreparedStatement CD1 = ConexionDB.getConexion().prepareStatement(D1);
    PreparedStatement CD2 = ConexionDB.getConexion().prepareStatement(D2);
    PreparedStatement CD3 = ConexionDB.getConexion().prepareStatement(D3);
    PreparedStatement CD4 = ConexionDB.getConexion().prepareStatement(D4);
    PreparedStatement CD5 = ConexionDB.getConexion().prepareStatement(D5);
    PreparedStatement CD6 = ConexionDB.getConexion().prepareStatement(D6);
    ResultSet LC1 = CD1.executeQuery();
    ResultSet LC2 = CD2.executeQuery();
    ResultSet LC3 = CD3.executeQuery();
    ResultSet LC4 = CD4.executeQuery();
    ResultSet LC5 = CD5.executeQuery();
    ResultSet LC6 = CD6.executeQuery();
    LC1.next();
    LC2.next();
    LC3.next();
    LC4.next();
    LC5.next();
    LC6.next();
    int cant1 = LC1.getInt(1);
    int cant2 = LC2.getInt(1);
    int cant3 = LC3.getInt(1);
    int cant4 = LC4.getInt(1);
    int cant5 = LC5.getInt(1);
    int cant6 = LC6.getInt(1);

%>
<script>
    const ctx = document.getElementById('myChart').getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Teclado', 'Disco duro', 'Mouse', 'Memoria Ram', 'Monitor', 'Gabinete'],
            datasets: [{
                    label: '# de productos en el almacen',
                    data: [<%=cant1%>, <%=cant2%>, <%=cant3%>, <%=cant4%>, <%=cant5%>, <%=cant6%>],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
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
