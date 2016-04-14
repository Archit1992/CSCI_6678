package command;

import java.net.UnknownHostException;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.util.JSON;

import model.User;
import mongo.ConnectionProvider;

public class CreateUserCommand {

	private static String userName;
	private static String password;

	public CreateUserCommand() {
		// TODO Auto-generated constructor stub

	}

	public String execute(User user)  {
		// TODO Auto-generated method stub

		ObjectMapper mapper = new ObjectMapper();

		ConnectionProvider userConn = new ConnectionProvider();
		DBCollection userCollection = null;
		DBObject dbObject=null;
			
		try {
				userCollection = userConn.getCollection("imdbUser");
			} catch (UnknownHostException e1) {
				// TODO Auto-generated catch block
				System.out.println("ERROR: Connection not established!");
			}
		
		try {
			
			dbObject = (DBObject) JSON.parse(mapper.writeValueAsString(user));
			System.out.println("DBObject value in String : "+dbObject);
			
			
		} catch (Exception e) {
			System.out.println("ERROR during mapping UserName/Password to Mongo Object");
			return "Error: During mapping User/Password.";
		}
		try{
			userCollection.insert(dbObject);
			
			return dbObject.get("firstName").toString();
		}catch(Exception e){
			System.out.println("INSERT quesry not executing !");
			e.printStackTrace();
		}
		return null;
		
	}

	public static void main(String[] args) {
		CreateUserCommand create = new CreateUserCommand();
		User user = new User();

		user.setFirstName(userName);
		user.setPassword(password);
		Object id = create.execute(user);
		
		if ( id!=null) {
			System.out.println("SUCCESS:Author Created:"+id);
		} else {
			System.out.println("ERROR:Failed to create author");
		}

	}
}
