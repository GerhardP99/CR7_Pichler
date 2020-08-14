public class Teachers {

    private int teacher_id;
    private String firstName;
    private String lastName;
    private String eMail;

    public Teachers(int teacher_id, String firstName, String lastName, String eMail){
        this.teacher_id = teacher_id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.eMail = eMail;
    }

    public int getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(int teacher_id) {
        this.teacher_id = teacher_id;
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
        return  "ID = " + teacher_id +
                ", First name = '" + firstName + '\'' +
                ", Last name = '" + lastName + '\'' +
                ", E-Mail = '" + eMail + '\'';
    }
}
