
 
 $(document).ready(function(){
	
	$("#btnForm").click(function() {
	 	//Se recogen los datos del formulario
		let nom = $("#fnombre").val();
		let edad = $("#fedad").val();
		
		//Se recoge los datos del token de seguridad de Java Spring Security. (Ver línea 12 y 13 de home.jsp)
		let token = $("meta[name='_csrf']").attr("content");
		let header = $("meta[name='_csrf_header']").attr("content");
	
		
		$.ajax({
				url     : './procesarDatos',
				dataType:"json",
				method     : 'POST',
				data     : {nombre:nom, edad:edad},
				//Se añade a la cabecera http. Prueba a quitar esta línea y veras que se genera error ¡¡
				beforeSend: request => request.setRequestHeader(header, token),
				success    : function(data){
					var error=data.error;
				    var descerror = data.msgerror;
				        
					if(error){
							$('#RespuestaError').html('<p style="color:red;">'+descerror+'</p>');
					} else {
						    $('#RespuestaError').html('<p style="color:green;">Datos enviados correctamente.</p>');
					}
				},
				error : function(jqXHR, exception){
					
				   $('#RespuestaError').html('<p style="color:red;">Error Fatal en el Servidor</p>');
				}
		});
	 });
	 

})
