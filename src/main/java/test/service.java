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
	
	@POST		/* ========================== POST Register Form =======================================*/
	@Path("create")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	
	
	public Response post( @FormParam("fname") String fName, @FormParam("password") String password ,
			@FormParam("lname") String lName,@FormParam("email") String email){
		
		User usr=new User();
		usr.setFirstName(fName);    // set User FirstName.
		usr.setLastName(lName); 	// set User LastName.
		usr.setEmail(email);		// set User Email.
		usr.setPassword(password);  // set Password.
		
		CreateUserCommand cmd=new CreateUserCommand();
		
		return Response.ok(new Viewable("/view/login.jsp",cmd.execute(usr))).build();
		
		/*try {
			return Response.status(200).entity(user+password).build();
		} catch (Exception e) {
			return Response.status(500).entity(e.toString()).build();
		}*/
	
	}
	
	@GET 	/* ========================== GET Login Form =======================================*/
	@Path("login")
	public Response mvcGetSong(@QueryParam("email") String email, @QueryParam("password") String password) {
		
		GetUserCommand cmd = new GetUserCommand();
		User usr=new User();
		usr.setEmail(email); 	// set User Email.
		usr.setPassword(password); // set Password.
		
		String userFound = cmd.execute(email,password);
		System.out.println("Response data from server : "+userFound);
		
		if(userFound == null){
			return Response.ok(new Viewable("/view/Error.jsp","Invalid Email Id and Password")).build();
		}
		else{
			return Response.ok(new Viewable("/view/ImdbSearch.jsp",userFound +" ,You are Successfully Logged in.")).build();
		}
	}
}