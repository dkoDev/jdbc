package dko.estab_conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Establecer_conexion {

	public static void main(String[] args) {
		
		String url = "jdbc:mysql://localhost:3306/maki";
		
		Connection conection = null;
		
		try {
			conection = DriverManager.getConnection(url, "dko", "1234");
			System.out.println("ok conecction");
		} catch (SQLException sql) {
			sql.printStackTrace();
		}finally{
			if(conection != null){
				try {
					conection.close();
					} catch (SQLException sql) {
					sql.printStackTrace();
				}
			}
			
		}
		
		
	}

}
