package es.dsw.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;


/* CONFIGURACIÓN DE SPRING SECURITY (Obligatorio)
 * 
 * A continuación se procede a configurar el comportamiento de Spring Security en nuestro proyecto. Para ello, al igual que ocurre con cualquier
 * configuración de spring que se implementa en una clase, debe precedir de la java annotation @Configuration (recordar que también se podría configurar en
 * un .xml). A continuación se debe indicar que esta clase configurará Spring Security añadiendo  @EnableWebSecurity.
 * */

@Configuration
@EnableWebSecurity
public class SecurityAppConfig {

	
	//CONFIGURACIÓN DE LOS USUARIOS DE ACCESO A LA APLICACIÓN (Obligatorio)
    //Se implementa el bean userDetailsService que será ejecutado al arrancar la aplicación. Dado que esto es un proyecto demo, dentro se construyen los usuarios
	//que en este caso se han fijado de forma estática. En este trozo de código, se podría conectar a base de datos y obtener la lista de usuarios y roles y construirlos
	//de forma dinámica.
	//Sin embargo, debes conocer que Spring Security tiene varias opciones a la hora de poder construir el pool de usuarios y en la documentación tiene pistas de como configurar
	//este módulo para que los extraiga de una tabla en bbdd o incluso conectar a un servicio LDAP.
	//Recuerda que @Bean indica a Spring que es un componente que devolverá un bean InMemoryUserDetailsManager cuyo identificador es el nombre del método.
    @Bean
    public InMemoryUserDetailsManager userDetailsService() {
      
    	//Esta java annotation únicamente está deshabilitando los warning producto de usar User.withDefaultPasswordEncoder. Realmente dicho método no está deprecate, sino que por seguridad
    	//se recuerda al desarrollador, que esta forma de crear usuarios no garantiza el cifrado de contraseñas. 
    	//Aquí se podría iterar cargando los usuarios que se obtengan desde base de datos.
    	
		@SuppressWarnings("deprecation")
		UserDetails user1 = User.withDefaultPasswordEncoder()
		    .username("pepito") //Nombre de usuario
            .password("1234")   //Password
            .roles("usuario", "administrador") //Roles
            .build();
		
		@SuppressWarnings("deprecation")
		UserDetails user2 = User.withDefaultPasswordEncoder()
		    .username("pepita")
            .password("5678")
            .roles("usuario")
            .build();
		
		
        //Se crea un objeto InMemoryUserDetailsManager que nos permitirá cargar los usuarios en memoria de aplicación.
        InMemoryUserDetailsManager InMemory = new InMemoryUserDetailsManager();//new InMemoryUserDetailsManager(user);
        
        //Se cargan los usuarios.
        InMemory.createUser(user1);
        InMemory.createUser(user2);
       
        //Se devuelve a el modulo de Spring Security el descriptor del objeto InMemoryUserDetailsManager para que surta efecto las modificaciones.
        return InMemory;
    }


    //CONFIGURACIÓN DE LOS FILTROS REQUEST DE HTTP (Opcional)
    //A continuación, se utiliza el siguiente bean para configurar los filtros de seguridad de httpSecurity.
    //Sin este método (sin este beans configurado) spring aplica una configuración por defecto creando por el mismo
    //una vista de login. Por ello, te invito a que pruebes a ejecutar este proyecto, comentando este método (filterChain).
    //
    //La filosofía de Spring Security es por defecto, denegar TODA petición, salvo el login por defecto que el mismo genera. Por ello, al configurar
    //los filtros de las peticiones, se recomienda, primero indicar, que rutas o recursos deben estar siempre accesibles (ej: .css, .js, etc) o
    //url pública que deba acceder cualquier cliente. Y a continuación, indicar los mapeos de controladora que solo son accesibles a usuarios autenticados con
    //determinados roles (autentificaciones). Si un usuario es autenticado, spring deja el acceso a todo, salvo a los filtros que indiquemos o discriminemos
    //según los roles de usuario.
    
    //Por lo tanto, si defines este beans, entonces spring security aplica los filtros que indiquemos.
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        

        
     	//Se indica a continuación que se aplicarán filtros a los request, es decir, a todas las peticiones al servidor.
     	http.authorizeRequests()
     	 		.regexMatchers("/styles/*.*") 
     	 			.permitAll()
     	 		.regexMatchers("/img/*.*")    
     	 			.permitAll() 
             	.regexMatchers("/js/*.*")    
         	 			.permitAll() 
         	 	.regexMatchers("/jqueryUI/*.*")    
     	 			.permitAll() 
             	.regexMatchers("/jqueryUI/jquery-ui-1.13.0/*.*")    
         	 			.permitAll() 
         	 	.regexMatchers("/ayuda")      
     	 			.permitAll() 
     	 		.anyRequest()
     	 			.authenticated() 
     	 				.and()
     	 					.formLogin() 
     	 						.loginPage("/loggin") 
     	 						.loginProcessingUrl("/logginprocess") 
     	 						.permitAll() 
     	 				.and()
     	 					.logout().permitAll(); 
     	
     	//Se devuelve el beans para que spring lo procese.
         return http.build();
    }
    
}