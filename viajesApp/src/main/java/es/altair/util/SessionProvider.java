package es.altair.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class SessionProvider {

	private static Session session;
	private static Configuration configuration;
	
	public SessionProvider() {		
	}
	
	static {
		configuration = new Configuration()
				.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect")
				.setProperty("hibernate.connection.driver.class", "com.mysql.jdbc.Driver")
				.setProperty("hibernate.connection.url", "jdbc:mysql://localhost/viajes")
				.setProperty("hibernate.connection.username", "root")
				.setProperty("hibernate.connection.password", "my123$%sql")
				.setProperty("hibernate.show_sql", "true")
				.addAnnotatedClass(es.altair.bean.Usuarios.class)
				.addAnnotatedClass(es.altair.bean.Viajes.class);
	}
	
	public static Session getSession() {
		SessionFactory sf = configuration.configure().buildSessionFactory();
		session = sf.openSession();
		return session;
	}
}
