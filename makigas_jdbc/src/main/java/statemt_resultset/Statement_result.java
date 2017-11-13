package statemt_resultset;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class Statement_result {

	private Connection conexion = null;

	public Statement_result() throws SQLException {
		try {
			conectar();
			System.out.println("puta vid#####!!");
			consulta();
		} catch (Exception e) {
			cerrar();
		}

	}

	public void conectar() throws SQLException {
		String url = "jdbc:mysql://localhost:3306/maki";
		conexion = DriverManager.getConnection(url, "dko", "1234");

	}

	public void cerrar() throws SQLException {
		if (conexion != null)
			conexion.close();
	}

	private void consulta() throws SQLException {
		System.out.println("puta vida!!");
		Statement statement = conexion.createStatement();
		ResultSet rs = statement.executeQuery("SELECT id_alumno, nombre, apellidos  FROM alumnos");
	
		while(rs.next()){
			int idAlumno = rs.getInt(1);
			String nombreAlumno = rs.getString(2);
			String apellidoAlumno = rs.getString(3);
			
			System.out.println("clve alumno "+idAlumno+"Nombre: "+nombreAlumno+"Apelliudos: "+apellidoAlumno+"\n");
			
		}
		rs.close();
		statement.close();
	}

	private static final Logger LOG = LoggerFactory
			.getLogger(Statement_result.class);

	public static void main(String[] args) {
		try {
			new Statement_result();
			
		} catch (SQLException sql) {
			//LOG.error("Error durante el uso del JDBC", sql);
			sql.getStackTrace();
		}
	}

}
