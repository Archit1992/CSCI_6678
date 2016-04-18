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
	
	@POST
	@Path("create")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	
	
	public Response registerUser( @FormParam("fname") String fName, @FormParam("password") String password ,
			@FormParam("lname") String lName,@FormParam("email") String email){
		
		User usr=new User();	// create an object of User.
		usr.setFirstName(fName);	// set First Name.
		usr.setLastName(lName);		// set Last Name.
		usr.setEmail(email);		// set Email.
		usr.setPassword(password); 	// set Password.
		
		CreateUserCommand cmd=new CreateUserCommand(); 	// create an object of CreateUserCommand.
		
		
		return Response.ok(new Viewable("/view/login.jsp",cmd.execute(usr))).build();	// return response. 
		
		/*try {
			return Response.status(200).entity(user+password).build();
		} catch (Exception e) {
			return Response.status(500).entity(e.toString()).build();
		}*/
	
	}
	
	@GET
	@Path("login")
	public Response getUser(@QueryParam("email") String email, @QueryParam("password") String password) {
		
		GetUserCommand cmd = new GetUserCommand();
		User usr=new User();	// create a object of User.	
		usr.setEmail(email);	// set Email.
		usr.setPassword(password);	// set Password.
		
		String userFound = cmd.execute(email,password); // execute() to search.
		System.out.println("Response data from server : "+userFound);  // getting response.
		
		if(userFound == null){
			return Response.ok(new Viewable("/view/Error.jsp","Invalid Email Id and Password")).build();
		}
		else{
			return Response.ok(new Viewable("/view/ImdbSearch.jsp",userFound +" ,You are Successfully Logged in.")).build();
		}
	}
}