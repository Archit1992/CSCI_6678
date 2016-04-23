package command;

import java.net.UnknownHostException;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

import model.User;
import mongo.ConnectionProvider;

public class ListAllUsersCommand {
	
	private static List<DBObject> list=null; // List for return list of data.
	
	public List<DBObject> execute(String email, String password) {
		
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
		try{
			cursor= (DBCursor) userCollection.find();
		}catch(Exception e){
			System.out.println("ERROR: Getting data from Database.");
			e.printStackTrace();
		}
		
		list=cursor.toArray();
		return list;
	}
}
