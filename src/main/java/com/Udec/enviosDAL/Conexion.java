
package com.Udec.enviosDAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author SALA DE INTERNET
 */
public class Conexion {
    String bd = "envios";
    String url = "jdbc:mysql://localhost:3306/"+bd;
    String user = "root";
    String pass = "root";
    Connection conn = null;
    
    public Conexion(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, pass);
            System.out.println("Conexion establecida");
        } catch (Exception e) {
            System.out.println("Imposible conexion:"+e);
        }
    }
    
    public int ejecutarSentenciasSQL (String strSentenciaSQL){
        try {
            PreparedStatement pstm = conn.prepareStatement(strSentenciaSQL);
            pstm.execute();
            return 1;
        } catch (SQLException e) {
            System.out.println("Error: "+e);
            return 0;
        }
    }
    
    public ResultSet consultarRegistros (String strSentenciaSQL){
        try {
            PreparedStatement pstm = conn.prepareStatement(strSentenciaSQL);
            ResultSet respuesta = pstm.executeQuery();
            return respuesta;
        } catch (Exception e) {
            System.out.println("Error: "+e);
            return null;
        }
    }
}
