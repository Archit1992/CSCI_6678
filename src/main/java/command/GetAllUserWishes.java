package command;

import java.net.UnknownHostException;
import java.util.List;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

import model.User;
import model.WishList;
import mongo.ConnectionProvider;

public class GetAllUserWishes {

	List<DBObject> list=null;
	
	public List<DBObject> execute(String loginId) {
		// TODO Auto-generated method stub
		
		ConnectionProvider conn = new ConnectionProvider();
		DBCollection userCollection = null;
		DBCursor cursor=null;
		DBObject user=null;
		String id=null;
		
		try {
			userCollection = conn.getCollection("imdbUserWishList");
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		DBObject searchQuery = new BasicDBObject();
		searchQuery.put("userId", loginId);
		
		System.out.println("Search Query : "+searchQuery.toString());
		System.out.println("Colleciton Name : "+userCollection.getFullName());
		
		try{
			cursor= (DBCursor) userCollection.find(searchQuery);
			
			list= cursor.toArray();
			return list;			
			
		}catch(Exception e){
			System.out.println("ERROR: Getting data from Database.");
			e.printStackTrace();
		}
		
		return null;
	}
	public static void main(String[] args) {
		
		GetAllUserWishes wish=new GetAllUserWishes();
		WishList ws = new WishList();

		ws.setUserId("user (?) id");		// for testing purposes.
		List obj= wish.execute(ws.getUserId());
		
		if (obj.toString() !=null) {
			System.out.println("SUCCESS::"+obj.toString());
		} else {
			System.out.println("ERROR:Failed to get User"+obj.toString());
		}

	}
}
