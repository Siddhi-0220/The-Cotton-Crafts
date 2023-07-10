package com.learn.cotton_crafts_2.helper;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class SessionFactoryProvider {
    private static SessionFactory factory ;

    public static SessionFactory getFactory() {
        try {
            if(factory == null){
                factory = new Configuration()
                        .configure("hibernate.cfg.xml")
                        .buildSessionFactory(); 
            }
        }catch (HibernateException e){
            e.printStackTrace();
        }
        return factory;
    }
}
