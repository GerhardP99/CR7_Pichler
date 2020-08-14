import java.sql.*;
import java.util.*;
import java.util.concurrent.TimeUnit;


public class DataAccess {
    private static Connection connection;
    private final String url = "jdbc:mysql://localhost:3306/cr7_pichler";

    public DataAccess() throws SQLException, ClassNotFoundException, InterruptedException {

        Class.forName("com.mysql.cj.jdbc.Driver");

        System.out.print("Connecting to database");
        TimeUnit.SECONDS.sleep(1);
        System.out.print(".");
        TimeUnit.SECONDS.sleep(1);
        System.out.print(".");
        TimeUnit.SECONDS.sleep(1);
        System.out.print(".");
        TimeUnit.SECONDS.sleep(1);
        System.out.print(".\n");
        connection = DriverManager.getConnection(
                url,
                new Secret().getUser(),
                new Secret().getPassword());

        connection.setAutoCommit(false);
        connection.setReadOnly(false);
    }

    public void closeConnection() throws SQLException, InterruptedException {
        System.out.print("Closing connection to Database");
        TimeUnit.SECONDS.sleep(1);
        System.out.print(".");
        TimeUnit.SECONDS.sleep(1);
        System.out.print(".");
        TimeUnit.SECONDS.sleep(1);
        System.out.print(".");
        TimeUnit.SECONDS.sleep(1);
        System.out.print(".\n");
        connection.close();
    }

    public List<Students> getAllStudents()throws SQLException{
        String sql = "SELECT * FROM students";
        PreparedStatement prepStatemet = connection.prepareStatement(sql);
        ResultSet resultSet = prepStatemet.executeQuery(sql);
        List<Students> list = new ArrayList<>();

        while(resultSet.next()){
            int student_id = resultSet.getInt("student_id");
            String firstName = resultSet.getString("first_name");
            String lastName = resultSet.getString("last_name");
            String eMail = resultSet.getString("email");
            list.add(new Students(student_id,firstName,lastName,eMail));
        }
        prepStatemet.close();
        return list;
    }

    public static List<Teachers> getAllTeachers()throws SQLException{
        String sql = "SELECT * FROM teachers";
        PreparedStatement prepStatemet = connection.prepareStatement(sql);
        ResultSet resultSet = prepStatemet.executeQuery(sql);
        List<Teachers> list = new ArrayList<>();

        while(resultSet.next()){
            int teacher_id = resultSet.getInt("teacher_id");
            String firstName = resultSet.getString("first_name");
            String lastName = resultSet.getString("last_name");
            String eMail = resultSet.getString("email");
            list.add(new Teachers(teacher_id,firstName,lastName,eMail));
        }
        prepStatemet.close();
        return list;
    }

    public static ArrayList<String> getTeacherClasses(int teacher_id) throws SQLException {
        ArrayList<String> coursesList = new ArrayList<>();
        String sql = "SELECT fk_class_name FROM enrollments INNER JOIN teachers ON teacher_id = enrollments.fk_teacher_id INNER JOIN classes ON classes.class_id = enrollments.fk_class_id WHERE teachers.teacher_id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, teacher_id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            coursesList.add(resultSet.getString(1));
        }
        preparedStatement.close();
        resultSet.close();
        return coursesList;
    }

    public static void teacherWitchCourse(int teacher_id) throws SQLException{
        ArrayList<String>teacherWithCourseList = getTeacherClasses(teacher_id);
        List<Teachers> teachersArrayList = getAllTeachers();
        String teacherSelected = "";

        boolean found = false;
        for(Teachers teachers : teachersArrayList){
            if(teachers.getTeacher_id() == teacher_id){
                teacherSelected = String.format("%s %s", teachers.getFirstName(), teachers.getLastName());
                found = true;
            }
        }
        if(found){
            if(!teacherWithCourseList.isEmpty()){
                System.out.printf("ID: %s Teacher %s teachers in class: ",teacher_id,teacherSelected);
                for(String course_name : teacherWithCourseList){
                    System.out.printf(" %s", course_name);
                }
            }
        }
    }

    public List<SchoolClasses> getAllClasses()throws SQLException{
        String sql = "SELECT * FROM classes";
        PreparedStatement prepStatemet = connection.prepareStatement(sql);
        ResultSet resultSet = prepStatemet.executeQuery(sql);
        List<SchoolClasses> list = new ArrayList<>();

        while(resultSet.next()){
            int class_id = resultSet.getInt("class_id");
            String className = resultSet.getString("class_name");
            list.add(new SchoolClasses(class_id,className));
        }
        prepStatemet.close();
        return list;
    }

    public Connection getConnection(){
        return connection;
    }
}
