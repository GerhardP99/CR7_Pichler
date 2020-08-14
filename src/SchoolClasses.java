public class SchoolClasses {
    private int class_id;
    private String className;

    public SchoolClasses(int class_id, String className){
        this.class_id = class_id;
        this.className = className;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    @Override
    public String toString() {
        return  "ID = " + class_id +
                ", Class name = '" + className + '\'';
    }
}
