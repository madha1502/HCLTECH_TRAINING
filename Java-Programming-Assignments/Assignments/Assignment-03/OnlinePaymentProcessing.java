import java.util.Scanner;
class Main{
    public static void main(String args[]){
        Scanner sc = new Scanner(System.in);
        int PaymentMethod = sc.nextInt();
        double amount = sc.nextDouble();
        Payment payment;
        if(PaymentMethod == 1){
            payment = new CreditCardPayment();
        }
        else if(PaymentMethod ==2){
            payment = new UpiPayment();
        }
        else{
            payment = new WalletPayment();
        }
        payment.calculateFee(amount);
    }
}
interface Payment{
    void calculateFee(double amount);
}
class CreditCardPayment implements Payment{
    @Override
    public void calculateFee(double amount){
        double transactionFee = amount * 0.02;
        System.out.println("Payment Amount : "+amount);
        System.out.println("Transaction Fee : "+transactionFee);
        System.out.println("Final Amount : "+(amount+transactionFee));
    }
}
class UpiPayment implements Payment{
    @Override
    public void calculateFee(double amount){
        double transactionFee = amount * 0.01;
        System.out.println("Payment Amount : "+amount);
        System.out.println("Transaction Fee : "+transactionFee);
        System.out.println("Final Amount : "+(amount+transactionFee));
    }
}
class WalletPayment implements Payment{
    @Override
    public void calculateFee(double amount){
        double transactionFee = amount * 0.05;
        System.out.println("Payment Amount : "+amount);
        System.out.println("Transaction Fee : "+transactionFee);
        System.out.println("Final Amount : "+(amount+transactionFee));
    }
}


