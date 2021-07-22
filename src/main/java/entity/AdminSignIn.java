package entity;

public class AdminSignIn {
    private String studentName;
    private String studentClass;
    private String stuDate;
    private int stuId;

    public int getStuId() {
        return stuId;
    }

    public void setStuId(int stuId) {
        this.stuId = stuId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentClass() {
        return studentClass;
    }

    public void setStudentClass(String studentClass) {
        this.studentClass = studentClass;
    }

    public String getStuDate() {
        return stuDate;
    }

    public void setStuDate(String stuDate) {
        this.stuDate = stuDate;
    }

    @Override
    public String toString() {
        return "AdminSignIn{" +
                "studentName='" + studentName + '\'' +
                ", studentClass='" + studentClass + '\'' +
                ", stuDate='" + stuDate + '\'' +
                ", stuId=" + stuId +
                '}';
    }
}
