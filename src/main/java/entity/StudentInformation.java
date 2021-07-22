package entity;

public class StudentInformation {
    private int id;
    private String studentUsername;
    private String studentPassword;
    private String studentName;
    private int studentGender;
    private String studentNation;
    private int studentAge;
    private String studentCollege;
    private String studentClass;
    private String studentDormNum;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentUsername() {
        return studentUsername;
    }

    public void setStudentUsername(String studentUsername) {
        this.studentUsername = studentUsername;
    }

    public String getStudentPassword() {
        return studentPassword;
    }

    public void setStudentPassword(String studentPassword) {
        this.studentPassword = studentPassword;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getStudentGender() {
        return studentGender;
    }

    public void setStudentGender(int studentGender) {
        this.studentGender = studentGender;
    }

    public String getStudentNation() {
        return studentNation;
    }

    public void setStudentNation(String studentNation) {
        this.studentNation = studentNation;
    }

    public int getStudentAge() {
        return studentAge;
    }

    public void setStudentAge(int studentAge) {
        this.studentAge = studentAge;
    }

    public String getStudentCollege() {
        return studentCollege;
    }

    public void setStudentCollege(String studentCollege) {
        this.studentCollege = studentCollege;
    }

    public String getStudentClass() {
        return studentClass;
    }

    public void setStudentClass(String studentClass) {
        this.studentClass = studentClass;
    }

    public String getStudentDormNum() {
        return studentDormNum;
    }

    public void setStudentDormNum(String studentDormNum) {
        this.studentDormNum = studentDormNum;
    }

    @Override
    public String toString() {
        return "StudentInformation{" +
                "id=" + id +
                ", studentUsername='" + studentUsername + '\'' +
                ", studentPassword='" + studentPassword + '\'' +
                ", studentName='" + studentName + '\'' +
                ", studentGender=" + studentGender +
                ", studentNation='" + studentNation + '\'' +
                ", studentAge=" + studentAge +
                ", studentCollege='" + studentCollege + '\'' +
                ", studentClass='" + studentClass + '\'' +
                ", studentDormNum='" + studentDormNum + '\'' +
                '}';
    }
}
