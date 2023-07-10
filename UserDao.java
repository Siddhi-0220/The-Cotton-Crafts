
package com.learn.cotton_crafts_2.dao;

import com.learn.cotton_crafts_2.entities.User;
//import jakarta.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
    private final SessionFactory factory;
    
    public UserDao(SessionFactory factory){
        this.factory = factory;
    }
    //getuser by email and password
	public User getUserByEmailAndPassword(String user_email, String user_password)
	{
	   User user=null;
            try {
		
		   //String query="from User where user_email=:e and user_password=:p";
		 
		   //Query q=session.createQuery(query);
		   
                   
                   Session session;
               session = this.factory.openSession();
                   
                   String query="FROM User WHERE userEmail= :e and userPassword= :p";
                   Query q = session.createQuery(query);
                   q.setParameter("e",user_email);
		   q.setParameter("p",user_password);
                   
		   user=(User) q.uniqueResult();
		   
		   session.close();
                   return user;
                } catch (Exception e) {
                    e.printStackTrace();
	}
	   return user;	
	}
    
}
