
import java.util.Scanner;

class Delivery {
    double orderAmount;

    Delivery(double amount) {
        orderAmount = amount;
    }

    double calculateDeliveryCharge() {
        return orderAmount;
    }
}

class RegularDelivery extends Delivery {
    RegularDelivery(double amount) {
        super(amount);
    }

    @Override
    double calculateDeliveryCharge() {
        return orderAmount + 40.0;
    }
}

class ExpressDelivery extends Delivery {
    ExpressDelivery(double amount) {
        super(amount);
    }

    @Override
    double calculateDeliveryCharge() {
        return orderAmount + 80.0 + (orderAmount * 5 / 100);
    }
}

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int type = sc.nextInt();
        double amount = sc.nextDouble();

        Delivery delivery;

        if (type == 1) {
            delivery = new RegularDelivery(amount);
        } else {
            delivery = new ExpressDelivery(amount);
        }

        System.out.printf("%.2f%n", delivery.calculateDeliveryCharge());
    }
}
