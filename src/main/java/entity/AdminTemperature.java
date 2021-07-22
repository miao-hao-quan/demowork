package entity;

public class AdminTemperature {
    private int stu_id;
    private String student_name;
    private String student_class;
    private double morning_temperature;
    private double evening_temperature;

    public String getStudent_class() {
        return student_class;
    }

    public void setStudent_class(String student_class) {
        this.student_class = student_class;
    }

    public int getStu_id() {
        return stu_id;
    }

    public void setStu_id(int stu_id) {
        this.stu_id = stu_id;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public double getMorning_temperature() {
        return morning_temperature;
    }

    public void setMorning_temperature(double morning_temperature) {
        this.morning_temperature = morning_temperature;
    }

    public double getEvening_temperature() {
        return evening_temperature;
    }

    public void setEvening_temperature(double evening_temperature) {
        this.evening_temperature = evening_temperature;
    }

    @Override
    public String toString() {
        return "AdminTemperature{" +
                "stu_id=" + stu_id +
                ", student_name='" + student_name + '\'' +
                ", student_class='" + student_class + '\'' +
                ", morning_temperature=" + morning_temperature +
                ", evening_temperature=" + evening_temperature +
                '}';
    }
}
