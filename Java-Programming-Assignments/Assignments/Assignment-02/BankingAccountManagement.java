import java.util.*;
abstract class BankAccount{
    int accountNumber;
    double balance;
    BankAccount(int accountNumber,double balance){
        this.accountNumber = accountNumber;
        this.balance = balance;
    }
    public abstract double calculateFinalBalance();
}
class SavingsAccount extends BankAccount{
    double intrestRate;
    SavingsAccount(int accountNumber,double balance,double intrestRate){
        super(accountNumber,balance);
        this.intrestRate=intrestRate;
    }
    @Override
    public double calculateFinalBalance(){
        double FinalBalance = balance+(balance*intrestRate/100);
        return FinalBalance;
    }
}
class CurrentAccount extends BankAccount{
    double overdraftLimit;
    CurrentAccount(int accountNumber,double balance,double overdraftLimit){
        super(accountNumber,balance);
        this.overdraftLimit=overdraftLimit;
    }
    @Override
    public double calculateFinalBalance(){
        double availabeAmount = balance+overdraftLimit;
        return availabeAmount;
    }
}
public class Main{
    public static void main(String args[]){
        Scanner sc = new Scanner(System.in);
        int accountType = sc.nextInt();
        int accountNumber = sc.nextInt();
        double balance = sc.nextDouble();
        BankAccount account;
        if(accountType==1){
            double intrestRate = sc.nextDouble();
            account = new SavingsAccount(accountNumber,balance,intrestRate);
        }
        else{
            double overdraftLimit = sc.nextDouble();
            account = new CurrentAccount(accountNumber,balance,overdraftLimit);
        }
        System.out.printf("%.2f%n",account.calculateFinalBalance());
        sc.close();
    }
}
