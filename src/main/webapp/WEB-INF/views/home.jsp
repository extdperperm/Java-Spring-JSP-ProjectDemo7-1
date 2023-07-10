<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<!DOCTYPE html> 
<html>
<head>
<meta charset="ISO-8859-1">
<!--Si quieres realizar peticiones POST bajo el m�dulo de seguridad de Spring, debes recoger el token y en cada env�o a�adirlo
    a la cabecera http. En este caso, lo que se hace es usar los meta como variable que posteriormente se recoger� desde el .js
    Tambi�n podr�a a�adirse a campos ocultos y recogerlos igualmente desde el .js
-->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Spring Proyect Demo 3</title>
<!-- En las vistas .jsp, se puede usar la siguiente directiva para construir las rutas a los recursos est�ticos:
		 ${pageContext.request.contextPath} 
     
     En este proyecto se ha optado por indicarlas de forma est�tica, pero si cambia en las controladoras la ubicaci�n l�gica y relativas mapeadas, podr�an producirse
     errores de acceso a los recursos (.js, .css) si no se actualizan manualmente.
-->
<link rel="stylesheet" href="./styles/index.css">

<!-- Carga de estilos UI JQUERY -->
<link type="text/css" href="./jqueryUI/jquery-ui-1.13.0/jquery-ui.min.css" rel="stylesheet" />
<!-- Carga de jquery -->
<!-- Carga de la librer�a base de jquery -->
<script src="./jqueryUI/jquery-3.6.0.min.js"></script>
<!-- Carga de la librer�a ui de jquery -->
<script src="./jqueryUI/jquery-ui-1.13.0/jquery-ui.min.js"></script>

<!-- Carga de los js relativos a la vista -->
<script src="./js/home.js"></script>

</head>
<body> 
    <div class="cabecera">
        <div class="cab1"></div>
        <div class="cap2"></div>
    </div>
    <div class="cuerpo">
        <div class="panel1">
            <div class="nota"><div class="notacab1"><p>Proyecto</p></div>
                              <div class="notabody"><p style="text-align: center;"><span>#Spring Proyect Demo 7-1</span></p>
                            </div>
            </div> 
            <div class="nota"><div class="notacab1"><p>Objetivos</p></div>
                              <div class="notabody"><p class="objetivos">- <b>S</b>pring Security y Peticiones As�ncronas con Ajax.</p>
                              </div>        
                            
            </div>
            <div class="nota"><div class="notacab2"><p>Entorno de Desarrollo</p></div>
                              <div class="notabody"><p><span>Ide:</span> Eclipse, versi�n: 2022-03 (4.23.0)</p>
                                                    <p><span>Servidor:</span> Apache Tomcat, versi�n: 9</p>
                                                    <p><span>Jdk:</span> OpenJdk, versi�n: 17.1</p>
                            </div>
            </div>
            <div class="nota"><div class="notacab2"><p>Estandar de Desarrollo</p></div>
                              <div class="notabody"><p><span>Gestor de proyecto:</span> Maven, versi�n: 3.8.0</p>
                                                    <p><span>Id Artefacto maven:</span> maven-archetype-webapp, versi�n: 1.4</p>
                                                    <p><span>Faceta:</span> Dynamic Web Module, versi�n: 4.0</p>
                            </div>
            </div> 
            <div class="nota"><div class="notacab2"><p>Dependencias</p></div>
                              <div class="notabody"><p><span>Spring Framework:</span> Spring, versi�n 5.3.22. M�dulos: Spring Web MVC</p>
                                                    <p><span>Javax servlet:</span> versi�n: 4.0.1</p>
                                                    <p><span>jstl:</span> versi�n: 1.2</p>
                                                    <p><span>spring security web:</span> versi�n: 5.7.3</p>
                                                    <p><span>spring security config:</span> versi�n: 5.7.3</p>
                                                    <p><span>spring security taglibs:</span> versi�n: 5.7.3</p>
                                                    <p><span>jackson-databind</span> versi�n: 2.12.4</p>
                            </div>
            </div>    
            <div class="nota"><div class="notacab2"><p>Documentaci�n y Sitios de Inter�s</p></div>
                              <div class="notabody"><p><a href="https://mvnrepository.com/" target="_blank">Ir a</a> Maven Repository</p>
                                                    <p><a href="https://docs.spring.io/spring-framework/docs/current/reference/html/" target="_blank">Leer</a> Documentaci�n de Spring</p>
                                                    <p><a href="https://docs.spring.io/spring-framework/docs/current/reference/html/web.html#mvc-view" target="_blank">Leer</a> Documentaci�n sobre Spring Views I</p>
                                                    <p><a href="https://docs.spring.io/spring-framework/docs/3.2.x/spring-framework-reference/html/view.html" target="_blank">Leer</a> Documentaci�n sobre Spring Views II</p>
                                                    <p><a href="https://www.javatpoint.com/spring-mvc-form-tag-library" target="_blank">Leer</a> Documentaci�n Spring Mvc Tags</p>
                                                    <p><a href="https://docs.spring.io/spring-security/reference/index.html" target="_blank">Leer</a> Documentaci�n Spring Security</p>
                                                    <p><a href="https://spring.io/blog/2022/02/21/spring-security-without-the-websecurityconfigureradapter" target="_blank">Leer</a> Informaci�n m�todos deprecate de Spring Security 2022</p>
                                                    <p><a href="http://www.jtech.ua.es/j2ee/restringido/cw/sesion08-apuntes.html" target="_blank">Leer</a> Informaci�n sobre otras estructuras de control de JSTL. (ej: c:if)</p>
                                                    <p><a href="https://api.jquery.com/jQuery.ajax/" target="_blank">Leer</a> Documentaci�n JQuery - Ajax</p>
                            </div>
            </div>         
        </div>
        <div class="panel2"> 
            <div class="item"><p><span>Ejemplo 1 - Petici�n Post con Security Spring:</span> Cuando se realizan peticiones Post bajo el control del modulo de seguridad, puede ocurrir que se reporte un error de seguridad desde el servidor. Esto ocurre cuando se est� bajo una autenticaci�n y ocurre debido a que en la cabecera http no viaja el token de seguridad de spring security.</p>
            				  <p>Si se hace uso de formularios de Spring Mvc Tags (jstl) este problema no ocurre pues a�ade autom�ticamente un campo oculto con el token.</p>
            				  <p>Pero si se crea en la vista un formulario html (estandar) puede ocurrir un error al enviar pues se debe a�adir a la cabecera http dicho token. Esto no ocurre con las peticiones Get.</p>
            				  <p>En el siguiente bot�n de formulario, al hacer clic, se env�a una petici�n as�ncrona y se muestra como se a�ade dicho token a la cabecera. La documentaci�n de spring que indica la soluci�n a este problema puedes localizarla aqu� <a href="https://docs.spring.io/spring-security/site/docs/5.0.x/reference/html/csrf.html" target="_blank">Ver Documentaci�n</a></p>
            				  <div>
            				  	<form action="#">
            				  		<p><label>Nombre: </label><input type="text" id="fnombre"/></p>
            				  		<p><label>Edad: </label><input type="number" id="fedad"/></p>
            				  		<p style="text-align:center;padding: 10px;"><button id="btnForm" type="button">Enviar</button></p>
            				  		<div id="RespuestaError"></div>
            				  	</form>
            				  </div>
	     		
            </div>

        </div>
    </div>
    <div class="pie"><p><span>�</span> 2022 - Daniel P�rez P�rez</p></div>

</body>
</html>