package command;

import java.net.UnknownHostException;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

import model.User;
import mongo.ConnectionProvider;

public class GetUserCommand {

	public String execute(String email, String password) {
		// TODO Auto-generated method stub
		
		
		ConnectionProvider conn = new ConnectionProvider();
		DBCollection userCollection = null;
		DBCursor cursor=null;
		DBObject user=null;
		
		
		try {
			userCollection = conn.getCollection("imdbUser");
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		DBObject searchQuery = new BasicDBObject();
		searchQuery.put("email", email);
		searchQuery.put("password",password);
		
		
		System.out.println("Search Query : "+searchQuery.toString());
		System.out.println("Colleciton Name : "+userCollection.getFullName());
		
		try{
			cursor= (DBCursor) userCollection.find(searchQuery);
		}catch(Exception e){
			System.out.println("ERROR: Getting data from Database.");
			e.printStackTrace();
		}
		try{
			
			while(cursor.hasNext()){
				return cursor.next().get("firstName").toString();			}
			
		}catch(Exception e){
			System.out.println("Error : Getting data from DBCursor."+user.toString());
			e.printStackTrace();
		}
		
		return null;
	}
	public static void main(String[] args) {
		
		GetUserCommand usr = new GetUserCommand();
		User user = new User();

		user.setEmail("gajjararchit00004@gmail.com");
		user.setPassword("hello");
		String obj= usr.execute(user.getEmail(),user.getPassword());
		
		if (obj.toString() !=null) {
			System.out.println("SUCCESS::"+obj);
		} else {
			System.out.println("ERROR:Failed to get User"+obj.toString());
		}

	}
}
