/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


//public class DBContext {
//   private static String DB_URL = "jdbc:mysql://b26668adc60082:606fb64c@us-cdbr-east-05.cleardb.net/heroku_376ef282da1ba9a?reconnect=true";
//    private static String USER_NAME = "b26668adc60082";
//    private static String PASSWORD = "606fb64c";
// 
//    public static Connection getConnection() {
//        Connection conn = null;
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
//            return conn;
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//        return conn;
//    }
//    
//    public static void main(String[] args) {
//        System.out.println(new DBContext().getConnection());
//    }
//}
public class DBContext {
   private static String DB_URL = "jdbc:mysql://localhost:3306/sneaker";
    private static String USER_NAME = "root";
    private static String PASSWORD = "123456";
 
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
            return conn;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return conn;
    }
    
    public static void main(String[] args) {
        System.out.println(new DBContext().getConnection());
    }
}