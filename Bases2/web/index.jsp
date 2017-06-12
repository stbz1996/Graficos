<%@page import="Controlador.consultaGeneral"%>
<%@page import="Controlador.DatosController"%>
<%@page import="java.lang.Integer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Conexion"%>
<%@page import="javax.validation.constraints.AssertFalse.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="control.js"></script>
        <link rel="stylesheet" type="text/css" href="Estilos/estilos.css">
        <script src="JQuery/jquery.js" type="text/javascript"></script> 
        <script type="text/javascript" src="JQuery/control.js"></script>
        <script src="http://d3js.org/d3.v3.min.js"></script>
        <title>Login</title>
    </head>
    
    <body  BACKGROUND="http://tecno.americaeconomia.com/sites/tecno.americaeconomia.com/files/styles/photo_inline/public/wysiwyg_imageupload/15/red%20social%20empresarial%202.jpg?itok=H6ZO8aul">
        
        <!-- Barra de seleccion de consultas -->
        <div id="barra" >
            <h1 id="texto">Consultas</h1>
            <button id="cajaCategoria" onclick="VerDatos1()"> Consulta 1</button>
            <button id="cajaCategoria" onclick="VerDatos2()"> Consulta 2</button>
            <button id="cajaCategoria" onclick="VerDatos3()"> Consulta 3</button>
            <button id="cajaCategoria" onclick="VerDatos4()"> Consulta 4</button>
            <button id="cajaCategoria" onclick="VerDatos5()"> Consulta 5</button>
            <button id="cajaCategoria" onclick="VerDatos6()"> Consulta 6</button>
        </div>
        <h1 id="texto2"> Información </h1>
        
        <%
            DatosController conexion = new DatosController();
            ArrayList<Integer> datos;
            ArrayList<String> hashtags;
            ArrayList<String> palabras;
            int cantidad;
            int maxValorAltura;
            int base;
        %>
        
        <!-- Consulta 1 -->
        <div class="datos" id="datos1">
                <%
                    /* Esta es la lista que viene desde la base de datos */
                    conexion.consulta1();
                    datos = conexion.dato1; 
                    hashtags = conexion.dato2; 
                    
                    /* Variables */
                    cantidad = datos.size();
                    maxValorAltura = 70000;
                    base = maxValorAltura / 10;
                %>
            <!-- Botonera -->
            <div class="botonera" id="botonera1">
                <button id="boton" onclick="VerGrafica1()"> Gráfica </button>
                <button id="boton" onclick="VerLista1()"> Tabla   </button>
            </div> 
            <!-- Muestra de datos en listas -->
            <div class="paginacionEstandar" id="lista1">
                <!-- Tabla de datos -->
                <table border class="tabla" id="tablaC1_1">
                    <tr>
                        <td id="cabeza"> HashTag  </td>
                        <td id="cabeza"> Cantidad </td>
                    </tr>
                    <% for(int i = 0; i < hashtags.size(); i++){ %>
                    <tr>
                        <td><%= hashtags.get(i) %></td>
                        <td><%= datos.get(i) %></td>
                    </tr>
                    <% } %>                
                </table>
            </div>
            <!-- grafico -->
            <div class="grafica" id="grafica1">
               <section class="tabla2">
                   <h3 id="pestanas"><%=base * 10%></h3>
                   <h3 id="pestanas"><%=base * 9%></h3>
                   <h3 id="pestanas"><%=base * 8%></h3>
                   <h3 id="pestanas"><%=base * 7%></h3>
                   <h3 id="pestanas"><%=base * 6%></h3>
                   <h3 id="pestanas"><%=base * 5%></h3>
                   <h3 id="pestanas"><%=base * 4%></h3>
                   <h3 id="pestanas"><%=base * 3%></h3>
                   <h3 id="pestanas"><%=base * 2%></h3>
                   <h3 id="pestanas"><%=base * 1%></h3>
                </section> 
                <svg id="graficoBarras1" width="315" height="245"></svg>
                
                <script>   
                    var config = {anchoBarra:(790/<%=cantidad%>), espacioEntreColumnas: 6, margin: 2, height: 400};
                    var maximo = <%= maxValorAltura %>;
                    var datos = [ 
                                ((<%= datos.get(0) %> * config.height) / maximo - 10),
                                ((<%= datos.get(1) %> * config.height) / maximo - 10),
                                ((<%= datos.get(2) %> * config.height) / maximo - 10),
                                ((<%= datos.get(3) %> * config.height) / maximo - 10),
                                ((<%= datos.get(4) %> * config.height) / maximo - 10),
                                ((<%= datos.get(5) %> * config.height) / maximo - 10),
                                ((<%= datos.get(6) %> * config.height) / maximo - 10),
                                ((<%= datos.get(7) %> * config.height) / maximo - 10)
                                ];
                    d3.select("#graficoBarras1")
                        .selectAll("rect")
                        .data(datos)
                        .enter().append("rect")
                        .attr("width", config.anchoBarra)
                        .attr("x", function(d,i) { return config.margin + i * (config.anchoBarra + config.espacioEntreColumnas) })
                        .attr("y", function(d,i) { return config.height - d })
                        .attr("height", function(d,i) { return d })
                </script>
                <div id="indiceDatos">
                    <h5><%= hashtags.get(0) %></h5>
                    <h5><%= hashtags.get(1) %></h5>
                    <h5><%= hashtags.get(2) %></h5>
                    <h5><%= hashtags.get(3) %></h5>
                    <h5><%= hashtags.get(4) %></h5>
                    <h5><%= hashtags.get(5) %></h5>
                    <h5><%= hashtags.get(6) %></h5>
                    <h5><%= hashtags.get(7) %></h5>
                </div>
            </div>          
        </div>
        <!-- ############################################################### -->
             
        <!-- Consulta 2 -->
        <div class="datos" id="datos2">
            <%
                /* Esta es la lista que viene desde la base de datos */
                    conexion.consulta2();
                    datos = conexion.dato1; 
                    hashtags = conexion.dato2; 
                    
                    /* Variables */
                    cantidad = datos.size();
                    maxValorAltura = 260000;
                    base = maxValorAltura / 10;
            %>
            <!-- Botonera -->
            <div class="botonera" id="botonera1">
                <button id="boton" onclick="VerGrafica2()"> Gráfica </button>
                <button id="boton" onclick="VerLista2()"> Tabla   </button>
            </div>      
            <div class="paginacionEstandar" id="lista2">
                <!-- Tabla de datos -->
                <table border class="tabla" id="tablaC2_1">
                    <tr>
                        <td id="cabeza"> HashTag  </td>
                        <td id="cabeza"> Tweets   </td>
                    </tr>
                    <% for(int i = 0; i < hashtags.size(); i++){ %>
                    <tr>
                        <td><%= hashtags.get(i) %></td>
                        <td><%= datos.get(i) %></td>
                    </tr>
                    <% } %>                
                </table>
            </div>
                
            <!-- grafico -->
            <div class="grafica" id="grafica2">
               <section class="tabla2">
                   <h3 id="pestanas"><%=base * 10%></h3>
                   <h3 id="pestanas"><%=base * 9%></h3>
                   <h3 id="pestanas"><%=base * 8%></h3>
                   <h3 id="pestanas"><%=base * 7%></h3>
                   <h3 id="pestanas"><%=base * 6%></h3>
                   <h3 id="pestanas"><%=base * 5%></h3>
                   <h3 id="pestanas"><%=base * 4%></h3>
                   <h3 id="pestanas"><%=base * 3%></h3>
                   <h3 id="pestanas"><%=base * 2%></h3>
                   <h3 id="pestanas"><%=base * 1%></h3>
                </section> 
                
                <svg id="graficoBarras2" width="315" height="245"></svg>
                
                <script>   
                    var config = {anchoBarra:(790/<%=cantidad%>), espacioEntreColumnas: 6, margin: 2, height: 400};
                    var maximo = <%= maxValorAltura %>;
                    var datos = [ 
                                ((<%= datos.get(0) %> * config.height) / maximo - 10),
                                ((<%= datos.get(1) %> * config.height) / maximo - 10),
                                ((<%= datos.get(2) %> * config.height) / maximo - 10),
                                ((<%= datos.get(3) %> * config.height) / maximo - 10),
                                ((<%= datos.get(4) %> * config.height) / maximo - 10),
                                ((<%= datos.get(5) %> * config.height) / maximo - 10),
                                ((<%= datos.get(6) %> * config.height) / maximo - 10),
                                ((<%= datos.get(7) %> * config.height) / maximo - 10)
                                ];
                    d3.select("#graficoBarras2")
                        .selectAll("rect")
                        .data(datos)
                        .enter().append("rect")
                        .attr("width", config.anchoBarra)
                        .attr("x", function(d,i) { return config.margin + i * (config.anchoBarra + config.espacioEntreColumnas) })
                        .attr("y", function(d,i) { return config.height - d })
                        .attr("height", function(d,i) { return d })
                </script>
                <div id="indiceDatos">
                    <h5><%= hashtags.get(0) %></h5>
                    <h5><%= hashtags.get(1) %></h5>
                    <h5><%= hashtags.get(2) %></h5>
                    <h5><%= hashtags.get(3) %></h5>
                    <h5><%= hashtags.get(4) %></h5>
                    <h5><%= hashtags.get(5) %></h5>
                    <h5><%= hashtags.get(6) %></h5>
                    <h5><%= hashtags.get(7) %></h5>
                </div>
            </div>            
                
        </div>
        <!-- ############################################################### -->
        
        <!-- Consulta 3 -->
        <div class="datos" id="datos3">
            <%
                /* Esta es la lista que viene desde la base de datos */
                    ArrayList<consultaGeneral> hashs = conexion.consulta3();   
                    maxValorAltura = 70;
                    cantidad = 10;
                    base = maxValorAltura / 10;
            %>
            <!-- Botonera -->
            <div class="botonera" id="botonera1">
                <button id="boton" onclick="VerGrafica3()"> Gráfica </button>
                <button id="boton" onclick="VerLista3()"> Tabla   </button>
            </div>      
            <div class="paginacionEstandar" id="lista3">
                <!-- Paginacion -->
                <section class="paginacion">
                    <ul>
                        <li><a onclick="VerTablaC3_1()"> 1 </a></li>
                        <li><a onclick="VerTablaC3_2()"> 2 </a></li>
                        <li><a onclick="VerTablaC3_3()"> 3 </a></li>
                        <li><a onclick="VerTablaC3_4()"> 4 </a></li>
                        <li><a onclick="VerTablaC3_5()"> 5 </a></li>
                        <li><a onclick="VerTablaC3_6()"> 6 </a></li>
                        <li><a onclick="VerTablaC3_7()"> 7 </a></li>
                        <li><a onclick="VerTablaC3_8()"> 8 </a></li>
                    </ul>
                </section> 
                <!-- Tabla de datos -->
                <table border class="tabla3" id="tablaC3_1">
                    <tr>
                        <td id="cabeza3"> Tweet     </td>
                        <td id="cabeza3"> Palabra    </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <TR>
                        <TD ROWSPAN=10><%= hashs.get(0).hastag %></TD>
                        <TD><%= hashs.get(0).palabras.get(0) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(0) %></TD> 
                    </TR>
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(1) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(1) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(2) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(2) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(3) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(3) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(4) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(4) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(5) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(5) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(6) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(6) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(7) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(7) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(8) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(8) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(9) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(9) %></TD>
                    </TR> 
                </table>
                
                <table border class="tabla3" id="tablaC3_2">
                    <tr>
                        <td id="cabeza3"> Tweet </td>
                        <td id="cabeza3"> Palabra   </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <TR>
                        <TD ROWSPAN=10><%= hashs.get(1).hastag %></TD>
                        <TD><%= hashs.get(1).palabras.get(0) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(0) %></TD> 
                    </TR>
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(1) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(1) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(2) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(2) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(3) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(3) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(4) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(4) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(5) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(5) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(6) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(6) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(7) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(7) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(8) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(8) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(9) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(9) %></TD>
                    </TR> 
                </table>
                
                <table border class="tabla3" id="tablaC3_3">
                    <tr>
                        <td id="cabeza3"> Tweet </td>
                        <td id="cabeza3"> Palabra   </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <TR>
                        <TD ROWSPAN=10><%= hashs.get(2).hastag %></TD>
                        <TD><%= hashs.get(2).palabras.get(0) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(0) %></TD> 
                    </TR>
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(1) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(1) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(2) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(2) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(3) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(3) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(4) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(4) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(5) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(5) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(6) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(6) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(7) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(7) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(8) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(8) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(9) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(9) %></TD>
                    </TR> 
                </table>
                
                <table border class="tabla3" id="tablaC3_4">
                    <tr>
                        <td id="cabeza3"> Tweet </td>
                        <td id="cabeza3"> Palabra   </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <TR>
                        <TD ROWSPAN=10><%= hashs.get(3).hastag %></TD>
                        <TD><%= hashs.get(3).palabras.get(0) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(0) %></TD> 
                    </TR>
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(1) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(1) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(2) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(2) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(3) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(3) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(4) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(4) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(5) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(5) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(6) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(6) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(7) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(7) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(8) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(8) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(9) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(9) %></TD>
                    </TR> 
                </table>
                
                <table border class="tabla3" id="tablaC3_5">
                    <tr>
                        <td id="cabeza3"> Tweet </td>
                        <td id="cabeza3"> Palabra   </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <TR>
                        <TD ROWSPAN=10><%= hashs.get(4).hastag %></TD>
                        <TD><%= hashs.get(4).palabras.get(0) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(0) %></TD> 
                    </TR>
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(1) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(1) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(2) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(2) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(3) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(3) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(4) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(4) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(5) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(5) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(6) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(6) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(7) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(7) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(8) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(8) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(9) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(9) %></TD>
                    </TR> 
                </table>
                
                <table border class="tabla3" id="tablaC3_6">
                    <tr>
                        <td id="cabeza3"> Tweet </td>
                        <td id="cabeza3"> Palabra   </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <TR>
                        <TD ROWSPAN=10><%= hashs.get(5).hastag %></TD>
                        <TD><%= hashs.get(5).palabras.get(0) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(0) %></TD> 
                    </TR>
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(1) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(1) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(2) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(2) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(3) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(3) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(4) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(4) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(5) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(5) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(6) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(6) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(7) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(7) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(8) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(8) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(9) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(9) %></TD>
                    </TR> 
                </table>
                
                <table border class="tabla3" id="tablaC3_7">
                    <tr>
                        <td id="cabeza3"> Tweet </td>
                        <td id="cabeza3"> Palabra   </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <TR>
                        <TD ROWSPAN=10><%= hashs.get(6).hastag %></TD>
                        <TD><%= hashs.get(6).palabras.get(0) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(0) %></TD> 
                    </TR>
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(1) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(1) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(2) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(2) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(3) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(3) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(4) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(4) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(5) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(5) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(6) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(6) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(7) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(7) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(8) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(8) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(9) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(9) %></TD>
                    </TR> 
                </table>
               
                <table border class="tabla3" id="tablaC3_8">
                    <tr>
                        <td id="cabeza3"> Tweet </td>
                        <td id="cabeza3"> Palabra   </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <TR>
                        <TD ROWSPAN=10><%= hashs.get(7).hastag %></TD>
                        <TD><%= hashs.get(7).palabras.get(0) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(0) %></TD> 
                    </TR>
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(1) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(1) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(2) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(2) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(3) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(3) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(4) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(4) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(5) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(5) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(6) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(6) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(7) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(7) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(8) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(8) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(9) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(9) %></TD>
                    </TR> 
                </table>          
            </div>      
            <!-- Paginacion -->
            <section class="paginacion" id="pagG1" style="display: none">
                    <ul>
                        <li><a onclick="VerG3_1()"> 1 </a></li>
                        <li><a onclick="VerG3_2()"> 2 </a></li>
                        <li><a onclick="VerG3_3()"> 3 </a></li>
                        <li><a onclick="VerG3_4()"> 4 </a></li>
                        <li><a onclick="VerG3_5()"> 5 </a></li>
                        <li><a onclick="VerG3_6()"> 6 </a></li>
                        <li><a onclick="VerG3_7()"> 7 </a></li>
                        <li><a onclick="VerG3_8()"> 8 </a></li>
                    </ul>
            </section> 
        
            <!-- grafico1 -->
            <div class="grafica" id="grafica3_1">
                <h2 id="texto2"> <%= hashs.get(0).hastag %> </h2>
               <section class="tabla2">
                   <h3 id="pestanas"><%=base * 10%></h3>
                   <h3 id="pestanas"><%=base * 9%></h3>
                   <h3 id="pestanas"><%=base * 8%></h3>
                   <h3 id="pestanas"><%=base * 7%></h3>
                   <h3 id="pestanas"><%=base * 6%></h3>
                   <h3 id="pestanas"><%=base * 5%></h3>
                   <h3 id="pestanas"><%=base * 4%></h3>
                   <h3 id="pestanas"><%=base * 3%></h3>
                   <h3 id="pestanas"><%=base * 2%></h3>
                   <h3 id="pestanas"><%=base * 1%></h3>
                </section> 
                <svg id="graficoBarras30" width="315" height="245"></svg>
                
                <script>   
                    var config = {anchoBarra:(790/<%=cantidad%>), espacioEntreColumnas: 6, margin: 2, height: 400};
                    var maximo = <%= maxValorAltura %>;
                    var indx = 0;
                    var datos = [ 
                                ((<%= hashs.get(0).cantidad.get(0) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(0).cantidad.get(1) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(0).cantidad.get(2) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(0).cantidad.get(3) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(0).cantidad.get(4) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(0).cantidad.get(5) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(0).cantidad.get(6) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(0).cantidad.get(7) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(0).cantidad.get(8) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(0).cantidad.get(9) %> * config.height) / maximo - 10)
                                ];
                    d3.select("#graficoBarras30")
                        .selectAll("rect")
                        .data(datos)
                        .enter().append("rect")
                        .attr("width", config.anchoBarra)
                        .attr("x", function(d,i) { return config.margin + i * (config.anchoBarra + config.espacioEntreColumnas) })
                        .attr("y", function(d,i) { return config.height - d })
                        .attr("height", function(d,i) { return d })
                </script>
                <div id="indiceDatos2">
                    <h5><%= hashs.get(0).palabras.get(0) %></h5>
                    <h5><%= hashs.get(0).palabras.get(1) %></h5>
                    <h5><%= hashs.get(0).palabras.get(2) %></h5>
                    <h5><%= hashs.get(0).palabras.get(3) %></h5>
                    <h5><%= hashs.get(0).palabras.get(4) %></h5>
                    <h5><%= hashs.get(0).palabras.get(5) %></h5>
                    <h5><%= hashs.get(0).palabras.get(6) %></h5>
                    <h5><%= hashs.get(0).palabras.get(7) %></h5>
                    <h5><%= hashs.get(0).palabras.get(8) %></h5>
                    <h5><%= hashs.get(0).palabras.get(9) %></h5>
                </div>
            </div>            
            
            <!-- grafico2 -->
            <%
                maxValorAltura = 1500;
                base = maxValorAltura / 10;
            %>
            <div class="grafica" id="grafica3_2">
                <h2 id="texto2"> <%= hashs.get(1).hastag %> </h2>
               <section class="tabla2">
                   <h3 id="pestanas"><%=base * 10%></h3>
                   <h3 id="pestanas"><%=base * 9%></h3>
                   <h3 id="pestanas"><%=base * 8%></h3>
                   <h3 id="pestanas"><%=base * 7%></h3>
                   <h3 id="pestanas"><%=base * 6%></h3>
                   <h3 id="pestanas"><%=base * 5%></h3>
                   <h3 id="pestanas"><%=base * 4%></h3>
                   <h3 id="pestanas"><%=base * 3%></h3>
                   <h3 id="pestanas"><%=base * 2%></h3>
                   <h3 id="pestanas"><%=base * 1%></h3>
                </section> 
                <svg id="graficodebarras31" width="315" height="245"></svg>
                
                <script>   
                    var config = {anchoBarra:(790/<%=cantidad%>), espacioEntreColumnas: 6, margin: 2, height: 400};
                    var maximo = <%= maxValorAltura %>;
                    var indx = 0;
                    var datos = [ 
                                ((<%= hashs.get(1).cantidad.get(0) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(1).cantidad.get(1) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(1).cantidad.get(2) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(1).cantidad.get(3) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(1).cantidad.get(4) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(1).cantidad.get(5) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(1).cantidad.get(6) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(1).cantidad.get(7) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(1).cantidad.get(8) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(1).cantidad.get(9) %> * config.height) / maximo - 10)
                                ];
                    d3.select("#graficodebarras31")
                        .selectAll("rect")
                        .data(datos)
                        .enter().append("rect")
                        .attr("width", config.anchoBarra)
                        .attr("x", function(d,i) { return config.margin + i * (config.anchoBarra + config.espacioEntreColumnas) })
                        .attr("y", function(d,i) { return config.height - d })
                        .attr("height", function(d,i) { return d })
                </script>
                <div id="indiceDatos2">
                    <h5><%= hashs.get(1).palabras.get(0) %></h5>
                    <h5><%= hashs.get(1).palabras.get(1) %></h5>
                    <h5><%= hashs.get(1).palabras.get(2) %></h5>
                    <h5><%= hashs.get(1).palabras.get(3) %></h5>
                    <h5><%= hashs.get(1).palabras.get(4) %></h5>
                    <h5><%= hashs.get(1).palabras.get(5) %></h5>
                    <h5><%= hashs.get(1).palabras.get(6) %></h5>
                    <h5><%= hashs.get(1).palabras.get(7) %></h5>
                    <h5><%= hashs.get(1).palabras.get(8) %></h5>
                    <h5><%= hashs.get(1).palabras.get(9) %></h5>
                </div>
            </div>            
              
            <!-- grafico3 -->
            <%
                maxValorAltura = 3500;
                base = maxValorAltura / 10;
            %>
            <div class="grafica" id="grafica3_3">
                <h2 id="texto2"> <%= hashs.get(2).hastag %> </h2>
               <section class="tabla2">
                   <h3 id="pestanas"><%=base * 10%></h3>
                   <h3 id="pestanas"><%=base * 9%></h3>
                   <h3 id="pestanas"><%=base * 8%></h3>
                   <h3 id="pestanas"><%=base * 7%></h3>
                   <h3 id="pestanas"><%=base * 6%></h3>
                   <h3 id="pestanas"><%=base * 5%></h3>
                   <h3 id="pestanas"><%=base * 4%></h3>
                   <h3 id="pestanas"><%=base * 3%></h3>
                   <h3 id="pestanas"><%=base * 2%></h3>
                   <h3 id="pestanas"><%=base * 1%></h3>
                </section> 
                <svg id="graficoBarras33" width="315" height="245"></svg>
                
                <script>   
                    var config = {anchoBarra:(790/<%=cantidad%>), espacioEntreColumnas: 6, margin: 2, height: 400};
                    var maximo = <%= maxValorAltura %>;
                    var indx = 0;
                    var datos = [ 
                                ((<%= hashs.get(2).cantidad.get(0) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(2).cantidad.get(1) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(2).cantidad.get(2) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(2).cantidad.get(3) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(2).cantidad.get(4) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(2).cantidad.get(5) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(2).cantidad.get(6) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(2).cantidad.get(7) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(2).cantidad.get(8) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(2).cantidad.get(9) %> * config.height) / maximo - 10)
                                ];
                    d3.select("#graficoBarras33")
                        .selectAll("rect")
                        .data(datos)
                        .enter().append("rect")
                        .attr("width", config.anchoBarra)
                        .attr("x", function(d,i) { return config.margin + i * (config.anchoBarra + config.espacioEntreColumnas) })
                        .attr("y", function(d,i) { return config.height - d })
                        .attr("height", function(d,i) { return d })
                </script>
                <div id="indiceDatos2">
                    <h5><%= hashs.get(2).palabras.get(0) %></h5>
                    <h5><%= hashs.get(2).palabras.get(1) %></h5>
                    <h5><%= hashs.get(2).palabras.get(2) %></h5>
                    <h5><%= hashs.get(2).palabras.get(3) %></h5>
                    <h5><%= hashs.get(2).palabras.get(4) %></h5>
                    <h5><%= hashs.get(2).palabras.get(5) %></h5>
                    <h5><%= hashs.get(2).palabras.get(6) %></h5>
                    <h5><%= hashs.get(2).palabras.get(7) %></h5>
                    <h5><%= hashs.get(2).palabras.get(8) %></h5>
                    <h5><%= hashs.get(2).palabras.get(9) %></h5>
                </div>
            </div>            
              
                
            <!-- grafico4 -->
            <%
                maxValorAltura = 1000;
                base = maxValorAltura / 10;
            %>
            <div class="grafica" id="grafica3_4">
                <h2 id="texto2"> <%= hashs.get(3).hastag %> </h2>
               <section class="tabla2">
                   <h3 id="pestanas"><%=base * 10%></h3>
                   <h3 id="pestanas"><%=base * 9%></h3>
                   <h3 id="pestanas"><%=base * 8%></h3>
                   <h3 id="pestanas"><%=base * 7%></h3>
                   <h3 id="pestanas"><%=base * 6%></h3>
                   <h3 id="pestanas"><%=base * 5%></h3>
                   <h3 id="pestanas"><%=base * 4%></h3>
                   <h3 id="pestanas"><%=base * 3%></h3>
                   <h3 id="pestanas"><%=base * 2%></h3>
                   <h3 id="pestanas"><%=base * 1%></h3>
                </section> 
                <svg id="graficoBarras34" width="315" height="245"></svg>
                
                <script>   
                    var config = {anchoBarra:(790/<%=cantidad%>), espacioEntreColumnas: 6, margin: 2, height: 400};
                    var maximo = <%= maxValorAltura %>;
                    var indx = 0;
                    var datos = [ 
                                ((<%= hashs.get(3).cantidad.get(0) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(3).cantidad.get(1) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(3).cantidad.get(2) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(3).cantidad.get(3) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(3).cantidad.get(4) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(3).cantidad.get(5) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(3).cantidad.get(6) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(3).cantidad.get(7) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(3).cantidad.get(8) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(3).cantidad.get(9) %> * config.height) / maximo - 10)
                                ];
                    d3.select("#graficoBarras34")
                        .selectAll("rect")
                        .data(datos)
                        .enter().append("rect")
                        .attr("width", config.anchoBarra)
                        .attr("x", function(d,i) { return config.margin + i * (config.anchoBarra + config.espacioEntreColumnas) })
                        .attr("y", function(d,i) { return config.height - d })
                        .attr("height", function(d,i) { return d })
                </script>
                <div id="indiceDatos2">
                    <h5><%= hashs.get(3).palabras.get(0) %></h5>
                    <h5><%= hashs.get(3).palabras.get(1) %></h5>
                    <h5><%= hashs.get(3).palabras.get(2) %></h5>
                    <h5><%= hashs.get(3).palabras.get(3) %></h5>
                    <h5><%= hashs.get(3).palabras.get(4) %></h5>
                    <h5><%= hashs.get(3).palabras.get(5) %></h5>
                    <h5><%= hashs.get(3).palabras.get(6) %></h5>
                    <h5><%= hashs.get(3).palabras.get(7) %></h5>
                    <h5><%= hashs.get(3).palabras.get(8) %></h5>
                    <h5><%= hashs.get(3).palabras.get(9) %></h5>
                </div>
            </div>            
              
            <!-- grafico5 -->
            <%
                maxValorAltura = 600;
                base = maxValorAltura / 10;
            %>
            <div class="grafica" id="grafica3_5">
                <h2 id="texto2"> <%= hashs.get(4).hastag %> </h2>
               <section class="tabla2">
                   <h3 id="pestanas"><%=base * 10%></h3>
                   <h3 id="pestanas"><%=base * 9%></h3>
                   <h3 id="pestanas"><%=base * 8%></h3>
                   <h3 id="pestanas"><%=base * 7%></h3>
                   <h3 id="pestanas"><%=base * 6%></h3>
                   <h3 id="pestanas"><%=base * 5%></h3>
                   <h3 id="pestanas"><%=base * 4%></h3>
                   <h3 id="pestanas"><%=base * 3%></h3>
                   <h3 id="pestanas"><%=base * 2%></h3>
                   <h3 id="pestanas"><%=base * 1%></h3>
                </section> 
                <svg id="graficoBarras35" width="315" height="245"></svg>
                
                <script>   
                    var config = {anchoBarra:(790/<%=cantidad%>), espacioEntreColumnas: 6, margin: 2, height: 400};
                    var maximo = <%= maxValorAltura %>;
                    var indx = 0;
                    var datos = [ 
                                ((<%= hashs.get(4).cantidad.get(0) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(4).cantidad.get(1) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(4).cantidad.get(2) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(4).cantidad.get(3) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(4).cantidad.get(4) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(4).cantidad.get(5) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(4).cantidad.get(6) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(4).cantidad.get(7) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(4).cantidad.get(8) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(4).cantidad.get(9) %> * config.height) / maximo - 10)
                                ];
                    d3.select("#graficoBarras35")
                        .selectAll("rect")
                        .data(datos)
                        .enter().append("rect")
                        .attr("width", config.anchoBarra)
                        .attr("x", function(d,i) { return config.margin + i * (config.anchoBarra + config.espacioEntreColumnas) })
                        .attr("y", function(d,i) { return config.height - d })
                        .attr("height", function(d,i) { return d })
                </script>
                <div id="indiceDatos2">
                    <h5><%= hashs.get(4).palabras.get(0) %></h5>
                    <h5><%= hashs.get(4).palabras.get(1) %></h5>
                    <h5><%= hashs.get(4).palabras.get(2) %></h5>
                    <h5><%= hashs.get(4).palabras.get(3) %></h5>
                    <h5><%= hashs.get(4).palabras.get(4) %></h5>
                    <h5><%= hashs.get(4).palabras.get(5) %></h5>
                    <h5><%= hashs.get(4).palabras.get(6) %></h5>
                    <h5><%= hashs.get(4).palabras.get(7) %></h5>
                    <h5><%= hashs.get(4).palabras.get(8) %></h5>
                    <h5><%= hashs.get(4).palabras.get(9) %></h5>
                </div>
            </div>            
              
            <!-- grafico6 -->
            <%
                maxValorAltura = 2500;
                base = maxValorAltura / 10;
            %>
            <div class="grafica" id="grafica3_6">
                <h2 id="texto2"> <%= hashs.get(5).hastag %> </h2>
               <section class="tabla2">
                   <h3 id="pestanas"><%=base * 10%></h3>
                   <h3 id="pestanas"><%=base * 9%></h3>
                   <h3 id="pestanas"><%=base * 8%></h3>
                   <h3 id="pestanas"><%=base * 7%></h3>
                   <h3 id="pestanas"><%=base * 6%></h3>
                   <h3 id="pestanas"><%=base * 5%></h3>
                   <h3 id="pestanas"><%=base * 4%></h3>
                   <h3 id="pestanas"><%=base * 3%></h3>
                   <h3 id="pestanas"><%=base * 2%></h3>
                   <h3 id="pestanas"><%=base * 1%></h3>
                </section> 
                <svg id="graficoBarras36" width="315" height="245"></svg>
                
                <script>   
                    var config = {anchoBarra:(790/<%=cantidad%>), espacioEntreColumnas: 6, margin: 2, height: 400};
                    var maximo = <%= maxValorAltura %>;
                    var indx = 0;
                    var datos = [ 
                                ((<%= hashs.get(5).cantidad.get(0) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(5).cantidad.get(1) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(5).cantidad.get(2) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(5).cantidad.get(3) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(5).cantidad.get(4) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(5).cantidad.get(5) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(5).cantidad.get(6) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(5).cantidad.get(7) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(5).cantidad.get(8) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(5).cantidad.get(9) %> * config.height) / maximo - 10)
                                ];
                    d3.select("#graficoBarras36")
                        .selectAll("rect")
                        .data(datos)
                        .enter().append("rect")
                        .attr("width", config.anchoBarra)
                        .attr("x", function(d,i) { return config.margin + i * (config.anchoBarra + config.espacioEntreColumnas) })
                        .attr("y", function(d,i) { return config.height - d })
                        .attr("height", function(d,i) { return d })
                </script>
                <div id="indiceDatos2">
                    <h5><%= hashs.get(5).palabras.get(0) %></h5>
                    <h5><%= hashs.get(5).palabras.get(1) %></h5>
                    <h5><%= hashs.get(5).palabras.get(2) %></h5>
                    <h5><%= hashs.get(5).palabras.get(3) %></h5>
                    <h5><%= hashs.get(5).palabras.get(4) %></h5>
                    <h5><%= hashs.get(5).palabras.get(5) %></h5>
                    <h5><%= hashs.get(5).palabras.get(6) %></h5>
                    <h5><%= hashs.get(5).palabras.get(7) %></h5>
                    <h5><%= hashs.get(5).palabras.get(8) %></h5>
                    <h5><%= hashs.get(5).palabras.get(9) %></h5>
                </div>
            </div>            
              
            <!-- grafico7 -->
            <%
                maxValorAltura = 40000;
                base = maxValorAltura / 10;
            %>
            <div class="grafica" id="grafica3_7">
                <h2 id="texto2"> <%= hashs.get(6).hastag %> </h2>
               <section class="tabla2">
                   <h3 id="pestanas"><%=base * 10%></h3>
                   <h3 id="pestanas"><%=base * 9%></h3>
                   <h3 id="pestanas"><%=base * 8%></h3>
                   <h3 id="pestanas"><%=base * 7%></h3>
                   <h3 id="pestanas"><%=base * 6%></h3>
                   <h3 id="pestanas"><%=base * 5%></h3>
                   <h3 id="pestanas"><%=base * 4%></h3>
                   <h3 id="pestanas"><%=base * 3%></h3>
                   <h3 id="pestanas"><%=base * 2%></h3>
                   <h3 id="pestanas"><%=base * 1%></h3>
                </section> 
                <svg id="graficoBarras37" width="315" height="245"></svg>
                
                <script>   
                    var config = {anchoBarra:(790/<%=cantidad%>), espacioEntreColumnas: 6, margin: 2, height: 400};
                    var maximo = <%= maxValorAltura %>;
                    var indx = 0;
                    var datos = [ 
                                ((<%= hashs.get(6).cantidad.get(0) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(6).cantidad.get(1) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(6).cantidad.get(2) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(6).cantidad.get(3) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(6).cantidad.get(4) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(6).cantidad.get(5) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(6).cantidad.get(6) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(6).cantidad.get(7) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(6).cantidad.get(8) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(6).cantidad.get(9) %> * config.height) / maximo - 10)
                                ];
                    d3.select("#graficoBarras37")
                        .selectAll("rect")
                        .data(datos)
                        .enter().append("rect")
                        .attr("width", config.anchoBarra)
                        .attr("x", function(d,i) { return config.margin + i * (config.anchoBarra + config.espacioEntreColumnas) })
                        .attr("y", function(d,i) { return config.height - d })
                        .attr("height", function(d,i) { return d })
                </script>
                <div id="indiceDatos2">
                    <h5><%= hashs.get(6).palabras.get(0) %></h5>
                    <h5><%= hashs.get(6).palabras.get(1) %></h5>
                    <h5><%= hashs.get(6).palabras.get(2) %></h5>
                    <h5><%= hashs.get(6).palabras.get(3) %></h5>
                    <h5><%= hashs.get(6).palabras.get(4) %></h5>
                    <h5><%= hashs.get(6).palabras.get(5) %></h5>
                    <h5><%= hashs.get(6).palabras.get(6) %></h5>
                    <h5><%= hashs.get(6).palabras.get(7) %></h5>
                    <h5><%= hashs.get(6).palabras.get(8) %></h5>
                    <h5><%= hashs.get(6).palabras.get(9) %></h5>
                </div>
            </div>            
              
            <!-- grafico8 -->
            <%
                maxValorAltura = 8000;
                base = maxValorAltura / 10;
            %>
            <div class="grafica" id="grafica3_8">
                <h2 id="texto2"> <%= hashs.get(7).hastag %> </h2>
               <section class="tabla2">
                   <h3 id="pestanas"><%=base * 10%></h3>
                   <h3 id="pestanas"><%=base * 9%></h3>
                   <h3 id="pestanas"><%=base * 8%></h3>
                   <h3 id="pestanas"><%=base * 7%></h3>
                   <h3 id="pestanas"><%=base * 6%></h3>
                   <h3 id="pestanas"><%=base * 5%></h3>
                   <h3 id="pestanas"><%=base * 4%></h3>
                   <h3 id="pestanas"><%=base * 3%></h3>
                   <h3 id="pestanas"><%=base * 2%></h3>
                   <h3 id="pestanas"><%=base * 1%></h3>
                </section> 
                <svg id="graficoBarras38" width="315" height="245"></svg>
                
                <script>   
                    var config = {anchoBarra:(790/<%=cantidad%>), espacioEntreColumnas: 6, margin: 2, height: 400};
                    var maximo = <%= maxValorAltura %>;
                    var indx = 0;
                    var datos = [ 
                                ((<%= hashs.get(7).cantidad.get(0) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(7).cantidad.get(1) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(7).cantidad.get(2) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(7).cantidad.get(3) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(7).cantidad.get(4) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(7).cantidad.get(5) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(7).cantidad.get(6) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(7).cantidad.get(7) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(7).cantidad.get(8) %> * config.height) / maximo - 10),
                                ((<%= hashs.get(7).cantidad.get(9) %> * config.height) / maximo - 10)
                                ];
                    d3.select("#graficoBarras38")
                        .selectAll("rect")
                        .data(datos)
                        .enter().append("rect")
                        .attr("width", config.anchoBarra)
                        .attr("x", function(d,i) { return config.margin + i * (config.anchoBarra + config.espacioEntreColumnas) })
                        .attr("y", function(d,i) { return config.height - d })
                        .attr("height", function(d,i) { return d })
                </script>
                <div id="indiceDatos2">
                    <h5><%= hashs.get(7).palabras.get(0) %></h5>
                    <h5><%= hashs.get(7).palabras.get(1) %></h5>
                    <h5><%= hashs.get(7).palabras.get(2) %></h5>
                    <h5><%= hashs.get(7).palabras.get(3) %></h5>
                    <h5><%= hashs.get(7).palabras.get(4) %></h5>
                    <h5><%= hashs.get(7).palabras.get(5) %></h5>
                    <h5><%= hashs.get(7).palabras.get(6) %></h5>
                    <h5><%= hashs.get(7).palabras.get(7) %></h5>
                    <h5><%= hashs.get(7).palabras.get(8) %></h5>
                    <h5><%= hashs.get(7).palabras.get(9) %></h5>
                </div>
            </div>            
                 
        </div>
        <!-- ############################################################### -->
        
        
        
        
        
        
        <!-- Consulta 4 -->
        <div class="datos" id="datos4">
            <%
                /* Esta es la lista que viene desde la base de datos */
                hashs = conexion.consulta4();   
            %>
                  
            <div class="paginacionEstandar" id="lista4">
                <!-- Paginacion -->
                <section class="paginacion">
                    <ul>
                        <li><a onclick="VerTablaC4_1()"> 1 </a></li>
                        <li><a onclick="VerTablaC4_2()"> 2 </a></li>
                        <li><a onclick="VerTablaC4_3()"> 3 </a></li>
                        <li><a onclick="VerTablaC4_4()"> 4 </a></li>
                        <li><a onclick="VerTablaC4_5()"> 5 </a></li>
                        <li><a onclick="VerTablaC4_6()"> 6 </a></li>
                        <li><a onclick="VerTablaC4_7()"> 7 </a></li>
                        <li><a onclick="VerTablaC4_8()"> 8 </a></li>
                    </ul>
                </section> 
                <!-- Tabla de datos -->
                <table border class="tabla3" id="tablaC4_1">
                    <tr>
                        <td id="cabeza3"> Hashtag </td>
                        <td id="cabeza3"> Hashtags   </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <TR>
                        <TD ROWSPAN=10><%= hashs.get(0).hastag %></TD>
                        <TD><%= hashs.get(0).palabras.get(0) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(0) %></TD> 
                    </TR>
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(1) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(1) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(2) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(2) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(3) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(3) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(4) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(4) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(5) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(5) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(6) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(6) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(7) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(7) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(8) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(8) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(0).palabras.get(9) %></TD> 
                        <TD><%= hashs.get(0).cantidad.get(9) %></TD>
                    </TR> 
                </table>
                
                <table border class="tabla3" id="tablaC4_2">
                    <tr>
                        <td id="cabeza3"> Hashtag </td>
                        <td id="cabeza3"> Hashtags   </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <TR>
                        <TD ROWSPAN=10><%= hashs.get(1).hastag %></TD>
                        <TD><%= hashs.get(1).palabras.get(0) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(0) %></TD> 
                    </TR>
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(1) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(1) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(2) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(2) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(3) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(3) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(4) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(4) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(5) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(5) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(6) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(6) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(7) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(7) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(8) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(8) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(1).palabras.get(9) %></TD> 
                        <TD><%= hashs.get(1).cantidad.get(9) %></TD>
                    </TR> 
                </table>
                
                <table border class="tabla3" id="tablaC4_3">
                    <tr>
                        <td id="cabeza3"> Hashtag </td>
                        <td id="cabeza3"> Hashtags   </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <TR>
                        <TD ROWSPAN=10><%= hashs.get(2).hastag %></TD>
                        <TD><%= hashs.get(2).palabras.get(0) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(0) %></TD> 
                    </TR>
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(1) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(1) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(2) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(2) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(3) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(3) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(4) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(4) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(5) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(5) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(6) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(6) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(7) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(7) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(8) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(8) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(2).palabras.get(9) %></TD> 
                        <TD><%= hashs.get(2).cantidad.get(9) %></TD>
                    </TR> 
                </table>
                
                <table border class="tabla3" id="tablaC4_4">
                    <tr>
                        <td id="cabeza3"> Hashtag </td>
                        <td id="cabeza3"> Hashtags   </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <TR>
                        <TD ROWSPAN=10><%= hashs.get(3).hastag %></TD>
                        <TD><%= hashs.get(3).palabras.get(0) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(0) %></TD> 
                    </TR>
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(1) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(1) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(2) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(2) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(3) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(3) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(4) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(4) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(5) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(5) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(6) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(6) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(7) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(7) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(8) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(8) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(3).palabras.get(9) %></TD> 
                        <TD><%= hashs.get(3).cantidad.get(9) %></TD>
                    </TR> 
                </table>
                
                <table border class="tabla3" id="tablaC4_5">
                    <tr>
                        <td id="cabeza3"> Hashtag </td>
                        <td id="cabeza3"> Hashtags   </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <TR>
                        <TD ROWSPAN=10><%= hashs.get(4).hastag %></TD>
                        <TD><%= hashs.get(4).palabras.get(0) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(0) %></TD> 
                    </TR>
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(1) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(1) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(2) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(2) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(3) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(3) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(4) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(4) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(5) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(5) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(6) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(6) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(7) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(7) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(8) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(8) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(4).palabras.get(9) %></TD> 
                        <TD><%= hashs.get(4).cantidad.get(9) %></TD>
                    </TR> 
                </table>
                
                <table border class="tabla3" id="tablaC4_6">
                    <tr>
                        <td id="cabeza3"> Hashtag </td>
                        <td id="cabeza3"> Hashtags   </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <TR>
                        <TD ROWSPAN=10><%= hashs.get(5).hastag %></TD>
                        <TD><%= hashs.get(5).palabras.get(0) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(0) %></TD> 
                    </TR>
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(1) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(1) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(2) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(2) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(3) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(3) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(4) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(4) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(5) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(5) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(6) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(6) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(7) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(7) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(8) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(8) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(5).palabras.get(9) %></TD> 
                        <TD><%= hashs.get(5).cantidad.get(9) %></TD>
                    </TR> 
                </table>
                
                <table border class="tabla3" id="tablaC4_7">
                    <tr>
                        <td id="cabeza3"> Hashtag </td>
                        <td id="cabeza3"> Hashtags   </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <TR>
                        <TD ROWSPAN=10><%= hashs.get(6).hastag %></TD>
                        <TD><%= hashs.get(6).palabras.get(0) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(0) %></TD> 
                    </TR>
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(1) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(1) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(2) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(2) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(3) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(3) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(4) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(4) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(5) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(5) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(6) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(6) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(7) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(7) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(8) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(8) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(6).palabras.get(9) %></TD> 
                        <TD><%= hashs.get(6).cantidad.get(9) %></TD>
                    </TR> 
                </table>
               
                <table border class="tabla3" id="tablaC4_8">
                    <tr>
                        <td id="cabeza3"> Hashtag </td>
                        <td id="cabeza3"> Hashtags   </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <TR>
                        <TD ROWSPAN=10><%= hashs.get(7).hastag %></TD>
                        <TD><%= hashs.get(7).palabras.get(0) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(0) %></TD> 
                    </TR>
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(1) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(1) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(2) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(2) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(3) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(3) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(4) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(4) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(5) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(5) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(6) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(6) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(7) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(7) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(8) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(8) %></TD>
                    </TR> 
                    <TR>
                        <TD><%= hashs.get(7).palabras.get(9) %></TD> 
                        <TD><%= hashs.get(7).cantidad.get(9) %></TD>
                    </TR> 
                </table>
                
                
                    
            </div>   
        </div>
        <!-- ############################################################### -->
        
        
        
        
        
        
        
        <!-- Consulta 5 -->
        <div class="datos" id="datos5">
            <%
                /* Esta es la lista que viene desde la base de datos */
                hashs = conexion.consulta5();   
            %>
                  
            <div class="paginacionEstandar" id="lista5">
                <!-- Paginacion -->
                <section class="paginacion">
                    <ul>
                        <li><a onclick="VerTablaC5_1()"> 1 </a></li>
                        <li><a onclick="VerTablaC5_2()"> 2 </a></li>
                        <li><a onclick="VerTablaC5_3()"> 3 </a></li>
                        <li><a onclick="VerTablaC5_4()"> 4 </a></li>
                        <li><a onclick="VerTablaC5_5()"> 5 </a></li>
                        <li><a onclick="VerTablaC5_6()"> 6 </a></li>
                        <li><a onclick="VerTablaC5_7()"> 7 </a></li>
                        <li><a onclick="VerTablaC5_8()"> 8 </a></li>
                    </ul>
                </section> 
                
                 <% for(int i = 0; i < 8; i++){ %>
                        <table border class="tabla3" id=<%= "tablaC5_" + (i + 1) %>>
                            <tr>
                                <td id="cabeza3"> Hashtag </td>
                                <td id="cabeza3"> Hora   </td>
                                <td id="cabeza3"> Cantidad   </td>
                            </tr>
                            <TR>
                                <TD ROWSPAN=24><%= hashs.get(i).hastag %></TD>
                                <TD><%= hashs.get(i).palabras.get(0) %></TD> 
                                <TD><%= hashs.get(i).cantidad.get(0) %></TD> 
                            </TR>
                            <% for(int k = 1; k < hashs.get(i).palabras.size(); k++){ %>
                                <TR>
                                    <TD><%= hashs.get(i).palabras.get(k) %></TD> 
                                    <TD><%= hashs.get(i).cantidad.get(k) %></TD>
                                </TR> 
                            <% } %> 
                        </table>
                <% } %>
                
                    
            </div>   
        </div>
        <!-- ############################################################### -->
        
        
        
        
        
        
        
        
        
        <!-- Consulta 6 -->
        <div class="datos" id="datos6">
            <!-- Botonera -->    
            <div class="paginacionEstandar" id="lista6" style="display: block;">
                <% 
                    ArrayList<consultaGeneral> data = conexion.consulta6();
                %>
                <table border class="tabla3" style="display: block; margin-top: 0.5%; margin-left: 0%;">
                    <tr>
                        <td id="cabeza3"> Hashtag </td>
                        <td id="cabeza3"> Hashtags incluidos </td>
                        <td id="cabeza3"> Cantidad   </td>
                    </tr>
                    <!-- Por cada elemento del hashtag -->
                    <% for(int i = 0; i < data.size(); i++){ %>
                        <TR>
                            <TD ROWSPAN=<%= data.get(i).palabras.size()%>> <%= data.get(i).hastag %> </TD>
                            <TD> <%= data.get(i).palabras.get(0) %> </TD> 
                            <TD> <%= data.get(i).cantidad.get(0) %> </TD> 
                        </TR>
                        <% for(int k = 1; k < data.get(i).palabras.size(); k++){ %>
                            <TR>
                                <TD> <%= data.get(i).palabras.get(k) %> </TD> 
                                <TD> <%= data.get(i).cantidad.get(k) %> </TD>
                            </TR>
                        <% } %>
                    <% } %> 
                </table>
            </div>     
        </div>
        <!-- ############################################################### -->                  
    </body>
</html>

