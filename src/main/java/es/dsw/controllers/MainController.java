package es.dsw.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import es.dsw.model.Usuario;

@Controller
public class MainController {
	
	@GetMapping(value= {"/","/home"})
	public String home() {
		
		return "home";
	} 
	
	@PostMapping(value= {"/","/procesarDatos"},produces="application/json")
	@ResponseBody 
	public Usuario procesardatos(@RequestParam(name="nombre", defaultValue = "") String Nom, @RequestParam(name="edad", defaultValue = "-1") int Edad) {
		
		Usuario objUsuario = new Usuario();
		
		objUsuario.setEdad(Edad);
		objUsuario.setNombre(Nom);
		objUsuario.setError(false);
		objUsuario.setMsgerror("");
		
		
		return objUsuario;
		
	}
	
	@GetMapping(value= {"/loggin"})
	public String loggin() {
		return "loggin";
	}
	
	@GetMapping(value= {"/ayuda"})
	public String ayuda() {
		return "ayuda";
	}

}
