import java.sql.*;
import java.util.List;

public class Main {

    public static void main(String[] args) throws SQLException {
        init(); // initializing the database
        Menu.runMenu(); // calling the menu
    }



    static public void init() { // db initialization method
        try {
            Menu.dataAccess = new DataAccess();
        } catch (Exception exc) {
            exc.printStackTrace();
        }
    }
    static public void close() { // db closing method
        try {
            Menu.dataAccess.closeConnection();
        } catch (Exception exc) {
            exc.printStackTrace();
        }
    }
    static public void displayAllStudents(List<Students> list){ // method to display all Students in the db
        String tableName = "";
        try{
            Statement stmt = Menu.dataAccess.getConnection().createStatement();
            String query = "SELECT * FROM students";
            ResultSet rs = stmt.executeQuery(query);
            ResultSetMetaData resultSetMetaData = rs.getMetaData();
            tableName = resultSetMetaData.getTableName(1);
        }catch(Exception exc){
            exc.printStackTrace();
        }
        System.out.println("\nListing all " + tableName + " \n");
        for(Students item : list) {
            System.out.println(item + "\n");
        }
    }
    static public void displayAllTeachers(List<Teachers> list){ // method to display all teachers in the db
        String tableName = "";
        try{
            Statement stmt = Menu.dataAccess.getConnection().createStatement();
            String query = "SELECT * FROM teachers";
            ResultSet rs = stmt.executeQuery(query);
            ResultSetMetaData resultSetMetaData = rs.getMetaData();
            tableName = resultSetMetaData.getTableName(1);
        }catch(Exception exc){
            exc.printStackTrace();
        }
        System.out.println("\nListing all " + tableName + " \n");
        for(Teachers item : list) {
            System.out.println(item + "\n");
        }
    }
    static public void displayAllClasses(List<SchoolClasses> list){ // method to display all classes in the db
        String tableName = "";
        try{
            Statement stmt = Menu.dataAccess.getConnection().createStatement();
            String query = "SELECT * FROM classes";
            ResultSet rs = stmt.executeQuery(query);
            ResultSetMetaData resultSetMetaData = rs.getMetaData();
            tableName = resultSetMetaData.getTableName(1);
        }catch(Exception exc){
            exc.printStackTrace();
        }
        System.out.println("\nListing all " + tableName + " \n");
        for(SchoolClasses item : list) {
            System.out.println(item + "\n");
        }
    }
}
