package entity;

public class StudentTemperature {
    private int id;
    private int stu_id;
    private double morning_temperature;
    private double evening_temperature;
    private String ipt_date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStu_id() {
        return stu_id;
    }

    public void setStu_id(int stu_id) {
        this.stu_id = stu_id;
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

    public String getIpt_date() {
        return ipt_date;
    }

    public void setIpt_date(String ipt_date) {
        this.ipt_date = ipt_date;
    }

    @Override
    public String toString() {
        return "Temperature{" +
                "id=" + id +
                ", stu_id=" + stu_id +
                ", morning_temperature=" + morning_temperature +
                ", evening_temperature=" + evening_temperature +
                ", ipt_date='" + ipt_date + '\'' +
                '}';
    }
}
