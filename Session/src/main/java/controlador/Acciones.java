package controlador;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;
import java.sql.*;
import java.util.ArrayList;

import javax.swing.JOptionPane;

public class Acciones {
	

	public Acciones() {
		driver = "com.mysql.jdbc.Driver";
		url ="jdbc:mysql://127.0.0.1:3306/Thor";
		uss="root";
		contra="will220670";

	}
	public void resgistrar(String nombre,String apellido,String email,String usuario,String contra) {
		try {
			Class.forName(this.driver);
			Connection miConexion = DriverManager.getConnection(this.url,this.uss,this.contra);
			PreparedStatement miPr = miConexion.prepareStatement("SELECT * FROM atf2 WHERE usuario = ? ", ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			miPr.setString(1,usuario);
			ResultSet miRs = miPr.executeQuery();
			if(miRs.absolute(1)) {
				control = 1;
				miConexion.close();
			}else {
				Statement miSt = miConexion.createStatement();
				String insSql ="INSERT INTO  atf2 (nombre,apellido,email,usuario,contrasena) VALUES('"+nombre+"','"+apellido+"','"+email+"','"+usuario+"','"+contra+"')";
				miSt.executeUpdate(insSql);
				control = 2;
				miConexion.close();
				
			}
		}catch(SQLException | ClassNotFoundException  e) {
			e.printStackTrace();
			System.out.println("No se ha podido hacer");
		}
		}
	
	
	
	
	public void Comprobar_Usuario(String usuario,String contra) {
		try {
			clave.add(usuario);
			Class.forName(this.driver);
			Connection miConexion = DriverManager.getConnection(this.url,this.uss,this.contra);
			PreparedStatement miPr = miConexion.prepareStatement("SELECT * FROM atf2 WHERE usuario = ? AND contrasena =?", ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			miPr.setString(1,usuario);
			miPr.setString(2,contra);
			ResultSet miRs = miPr.executeQuery();
			if(miRs.absolute(1)) {
				control = 1;
				//JOptionPane.showConfirmDialog(null, "Existe Usuario");
				
			}
			else {
				control = 2;
				//JOptionPane.showConfirmDialog(null, "NO Existe Usuario");
			}
			}catch(Exception e){
				 System.out.println("Error al registrar el driver de PostgreSQL: " + e);
			}
		
	}
	
	public int controlar() {

		return control;
		
	}
	
	

	public void Resultado() {
		for( String elm : clave) {
			valor = elm;
		}
		
		
	}
	
	
	
	

    

	String driver;
	String url;
	String uss;
	String  contra;
	String nombre,apellido,email,usuario,contrasena,valor;
	String mensajeTexto;
	int control;
	ArrayList <String> clave = new ArrayList<String>();
  }

