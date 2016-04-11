package main.java.test;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

@Path("user")
public class service {

	@GET
	@Path("temp")
	
	public Response getString(){
		return Response.status(200).entity("Hello Archit").build();
	}
	
}
