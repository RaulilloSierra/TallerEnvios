
package com.Udec.enviosDAL;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author SALA DE INTERNET
 */
public class Conexion {
    String strConexion = "";
    Connection conn = null;
    
    public Conexion(){
        try {
            Class.forName("");
            conn = DriverManager.getConnection(strConexion);
            System.out.println("Conexion establecida");
        } catch (Exception e) {
            System.out.println("Imposible conexion:"+e);
        }
    }
}
