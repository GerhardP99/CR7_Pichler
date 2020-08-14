import java.sql.SQLException;
import java.util.Scanner;

public class Menu {
    static DataAccess dataAccess;

    private static String head() {
        return "+---------------------------------+\n" +
                String.format("|        %-25s|%n", "Welcome") +
                String.format("|        %-25s|%n", "to the") +
                String.format("|        %-25s|%n", "School DB") +
                "+---------------------------------+\n" +
                "\nMake a selection:\n";
    }

    private static void printMenu() {
        String[] menuItems = {"Exit",
                "List all Students",
                "List all Teachers",
                "List all Classes",
                "List all Teachers with their class"
                 };
        printOut(menuItems);
    }

    private static void printOut(String[] menuItems) {
        System.out.println(head() + generateMenu(menuItems) + prompt());
    }

    private static String generateMenu(String[] menuItems) {
        StringBuilder menu = new StringBuilder();
        for (int i = 1; i < menuItems.length; i++) {
            menu.append(String.format("%1d) %s%n", i, menuItems[i]));
        }
        return menu.toString() + String.format("%1d) %s%n", 0, menuItems[0]);
    }

    private static String prompt() {
        return  "Enter your choice: ";
    }

    public static void runMenu() throws SQLException {
        printMenu();
        int selection = getUserinput();
        boolean exit = false;
        switch (selection) {
            case 0:
                System.out.println("Goodbye! :)");
                exit = true;
                break;
            case 1:
                try{
                    Main.displayAllStudents(dataAccess.getAllStudents());
                }catch(Exception exc){
                    exc.printStackTrace();
                }
                break;
            case 2:
                try{
                    Main.displayAllTeachers(dataAccess.getAllTeachers());
                }catch(Exception exc){
                    exc.printStackTrace();
                }
                break;
            case 3:
                try{
                    Main.displayAllClasses(dataAccess.getAllClasses());
                }catch(Exception exc){
                    exc.printStackTrace();
                }
                break;
            case 4:
                try{
                    Main.displayAllTeachers(dataAccess.getAllTeachers());
                }catch(Exception exc){
                    exc.printStackTrace();
                }
                System.out.println("Please select a Teacher ID now: ");
                int teacherSelect = Integer.parseInt(String.valueOf(getUserinput()));
                DataAccess.teacherWitchCourse(teacherSelect);
                break;
            case 5:

                break;
            case 6:
                break;
            default:
                System.out.println("Invalid input: " + selection);
                sleep();
        }
        if (!exit) {
            enterToContinue();
            runMenu();
        }
    }


    private static void enterToContinue()
    {
        System.out.println("\n\nPress Enter to continue...");
        try
        {
            System.in.read();
        }
        catch(Exception e)
        {}
    }

    public static int getUserinput() {
        Scanner sc = new Scanner(System.in);
        int result = 11;
        boolean done = false;
        while (!done && sc.hasNext()) {
            if (sc.hasNextInt()) {
                result = sc.nextInt();
                done = true;
            } else {
                System.out.println("Invalid input: " + sc.next());
                sleep();
                printMenu();
            }
        }
        return result;
    }

    public String getUserInputString() {
        Scanner sc = new Scanner(System.in);
        return sc.next();
    }

    private static void sleep() {
        try {
            Thread.sleep(1000);
        } catch (InterruptedException exc) {
            exc.printStackTrace();
        }
    }
}