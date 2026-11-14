import java.util.Scanner;
abstract class Employee {
    private int employeeId;
    private String employeeName;
    public Employee(int employeeId, String employeeName) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
    }
    public int getEmployeeId() {
        return employeeId;
    }
    public String getEmployeeName() {
        return employeeName;
    }
    public abstract double calculateSalary();
}
class FullTimeEmployee extends Employee {
    private double monthlySalary;
    public FullTimeEmployee(int employeeId, String employeeName, double monthlySalary) {
        super(employeeId, employeeName);
        this.monthlySalary = monthlySalary;
    }
    @Override
    public double calculateSalary() {
        return monthlySalary;
    }
}
class ContractEmployee extends Employee {
    private int workingDays;
    private double dailyRate;
    public ContractEmployee(int employeeId, String employeeName, int workingDays, double dailyRate) {
        super(employeeId, employeeName);
        this.workingDays = workingDays;
        this.dailyRate = dailyRate;
    }
    @Override
    public double calculateSalary() {
        return workingDays * dailyRate;
    }
}
public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        if (!scanner.hasNextInt()) return;
        int employeeType = scanner.nextInt();
        int employeeId = scanner.nextInt();
        String employeeName = scanner.next();
        Employee employee = null;
        if (employeeType == 1) {
            double monthlySalary = scanner.nextDouble();
            employee = new FullTimeEmployee(employeeId, employeeName, monthlySalary);
        } else if (employeeType == 2) {
            int workingDays = scanner.nextInt();
            double dailyRate = scanner.nextDouble();
            employee = new ContractEmployee(employeeId, employeeName, workingDays, dailyRate);
        }
        if (employee != null) {
            System.out.println("Employee ID: " + employee.getEmployeeId());
            System.out.println("Employee Name: " + employee.getEmployeeName());
            System.out.printf("Salary: %.2f%n", employee.calculateSalary());
        }
        scanner.close();
    }
}
