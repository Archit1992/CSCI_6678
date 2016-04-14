package test;


import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.glassfish.jersey.server.mvc.Viewable;


import command.CreateUserCommand;
import command.GetUserCommand;
import model.User;

@Path("user")
public class Service {
	
	@POST 		/* ========================POST Method =================================*/
	@Path("create")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	
	
	public Response post( @FormParam("fname") String fName, @FormParam("password") String password ,
			@FormParam("lname") String lName,@FormParam("email") String email){
		
		User usr=new User();
		usr.setFirstName(fName); // set user's first name.
		usr.setLastName(lName); // set user's last name.
		usr.setEmail(email);    // set user's email address.
		usr.setPassword(password);  // set user's password.
		
		CreateUserCommand cmd=new CreateUserCommand();  // create a instace of CreateUserCommand.
		
		// return Response go back to login.jsp 
		return Response.ok(new Viewable("/view/login.jsp",cmd.execute(usr))).build(); 
		
		/*try {
			return Response.status(200).entity(user+password).build();
		} catch (Exception e) {
			return Response.status(500).entity(e.toString()).build();
		}*/
	
	}
	
}