package dko.Statement_resultSet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class Statement_result {

	private Connection conexion = null;

	public Statement_result() throws SQLException {
		try {
			conectar();
			consulta();
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		finally{
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
		Statement statement = conexion.createStatement();
		ResultSet rs = statement.executeQuery("SELECT id_alumno, nombre, apellidos  FROM alumno");
	
		while(rs.next()){
			int idAlumno = rs.getInt(1);
			String nombreAlumno = rs.getString(2);
			String apellidoAlumno = rs.getString(3);
			
			System.out.println("clve alumno: "+idAlumno+" Nombre: "+nombreAlumno+" Apellidos: "+apellidoAlumno+"\n");
			
		}
		rs.close();
		statement.close();
	}

	//private static final Logger LOG = LoggerFactory.getLogger(Statement_result.class);

	public static void main(String[] args) {
		try {
			new Statement_result();
			
		} catch (Exception sql) {
			//LOG.error("Error durante el uso del JDBC", sql);
			//sql.getStackTrace();
			sql.getMessage();
			sql.printStackTrace();
		}
	}

}
