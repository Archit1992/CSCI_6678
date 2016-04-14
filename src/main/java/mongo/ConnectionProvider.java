package mongo;

import java.net.UnknownHostException;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.MongoException;

public class ConnectionProvider {

	public DBCollection getCollection(String collectionName) throws UnknownHostException {
		// TODO Auto-generated method stub
		
		try {
			
			MongoClientURI uri = new MongoClientURI("mongodb://<db:user>:<db:password>@ds<db:port>.mlab.com:<db:port>/<db:name>");
			MongoClient client = new MongoClient(uri); // MongoClient connected with the specified URI.

			@SuppressWarnings("deprecation")
			DB db = client.getDB(uri.getDatabase()); // Database Object created.
			
			if (db == null) {
				System.out.println("Could not connect to Database");
			}
			
			
			DBCollection userColl = db.getCollection(collectionName);
			return userColl;

		} catch (MongoException e) {
			e.printStackTrace();
		}
		return null;
	}

}
