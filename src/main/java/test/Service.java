package test;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


import org.glassfish.jersey.server.mvc.Viewable;

import com.sun.research.ws.wadl.Request;

import command.CreateUserCommand;
import command.CreateWishCommand;
import command.GetUserCommand;
import model.User;
import model.WishList;

@Path("user")
public class Service {
	
	@POST
	@Path("create")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	
	
	public Response post( @FormParam("fname") String fName, @FormParam("password") String password ,
			@FormParam("lname") String lName,@FormParam("email") String email){
		
		System.out.println("First Name is :"+fName);
		
		System.out.println("Last Name is :"+lName);
		System.out.println("Email id is : "+email);
		System.out.println("Password is : "+password);
		
		User usr=new User();
		usr.setFirstName(fName);
		usr.setLastName(lName);
		usr.setEmail(email);
		usr.setPassword(password);
		
		CreateUserCommand cmd=new CreateUserCommand();
		
		return Response.ok(new Viewable("/view/login.jsp",cmd.execute(usr))).build();
		
		/*try {
			return Response.status(200).entity(user+password).build();
		} catch (Exception e) {
			return Response.status(500).entity(e.toString()).build();
		}*/
	
	}
	
	@GET
	@Path("login")
	public Response mvcGetSong(@QueryParam("login") String login, @QueryParam("password") String password) {
		
		GetUserCommand cmd = new GetUserCommand();
		User usr=new User();
		usr.setEmail(login);
		usr.setPassword(password);
		
		String userFound = cmd.execute(login,password);
		System.out.println("Response data from server : "+userFound);
		
		if(userFound == null){
			return Response.ok(new Viewable("/view/Error.jsp","Invalid Email Id and Password")).build();
		}
		else{
			return Response.ok(new Viewable("/view/success.jsp",userFound)).build();
		}
	}
	
	@SuppressWarnings("deprecation")
	@GET
	@Path("add")
	public Response addWish(@QueryParam("id") String imdbId, @QueryParam("releasedDate") String releaseDate) {
		
		
		System.out.println("IMDB ID  is : "+imdbId);
		System.out.println("IMDB Date is : "+releaseDate);
		
		// Error: MM/dd/yyyy
		SimpleDateFormat x = new SimpleDateFormat("dd MMMMM yyyy",Locale.ENGLISH);
		Date d1 = null;
		try {
			d1 = x.parse(releaseDate);
		}catch(ParseException e){
			Response.status(400).entity("Invalid date format.").build();
		}
		System.out.println("Day :"+d1.getDay()+" Month: "+d1.getMonth()+" Year: "+d1.getYear());
		
		WishList wish=new WishList();
		wish.setDate(d1.getDay(),d1.getMonth(),d1.getYear());
		wish.setImdbId(imdbId);
		
		CreateWishCommand userWish=new CreateWishCommand();
		String imdb_Id=userWish.execute(wish);
		
		if(imdb_Id == null){
			return Response.ok(new Viewable("/view/400Bad.jsp"," Bad request")).build();
			
		}else{
			return Response.ok("Your id+"+imdbId).build();
		}
		
		
	}
}