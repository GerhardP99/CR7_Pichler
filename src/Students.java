public class Students {
    private int student_id;
    private String firstName;
    private String lastName;
    private String eMail;

    public Students(int student_id, String firstName, String lastName, String eMail){
        this.student_id = student_id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.eMail = eMail;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String geteMail() {
        return eMail;
    }

    public void seteMail(String eMail) {
        this.eMail = eMail;
    }

    @Override
    public String toString() {
        return  "ID = " + student_id +
                ", First name = '" + firstName + '\'' +
                ", Last name = '" + lastName + '\'' +
                ", E-Mail = '" + eMail + '\'';
    }
}
