/*
 * Name: Derek Avery
 * Date: July 25, 2025
 * Assignment SDC230 Final Practical Exam
 * 
 * This class will take 5 values entered by the user, 
 * determine that they are within the range 0 - 100, 
 * and calculate the largest number, smallest number, 
 * sum of inputs, average of inputs, and the first number 
 * divided by the last number.
 */
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Unique {
    private ArrayList<Double> member;

    public Unique() {
        member = new ArrayList<>();
    }

    
    public void setUnique() {
        Scanner input = new Scanner(System.in);

        while (member.size() < 5) {
            try {
                System.out.print("Enter a unique number between 0 and 100: ");
                double value = input.nextDouble();

                if (value < 0 || value > 100) {
                    throw new Exception("Number entered is not between 0 and 100.");
                }

                if (member.contains(value)) {
                    System.out.println("This number has already been used. Please enter a unique number.");
                } else {
                    member.add(value);
                }

            } catch (InputMismatchException e) {
                System.err.println("Invalid input. Please enter a number between 0 and 100.");
                input.nextLine();
            } catch (Exception e) {
                System.err.println(e.getMessage());
            }
        }
    }

    public ArrayList<Double> getNumbersList() {
        return member;
    }

    public double getLargest() {
        double max = member.get(0);
        for (double num : member) {
            if (num > max) max = num;
        }
        return max;
    }

    public double getSmallest() {
        double min = member.get(0);
        for (double num : member) {
            if (num < min) min = num;
        }
        return min;
    }

    public double getSum() {
        double sum = 0;
        for (double num : member) {
            sum += num;
        }
        return sum;
    }

    public double getAverage() {
        return getSum() / member.size();
    }

    public double divideLastByFirst() {
        double first = member.get(0);
        double last = member.get(4);

        if (first == 0) {
            throw new ArithmeticException("Cannot divide by zero.");
        }

        return last / first;
    }

    public void displayData() {
        System.out.printf("\nUnique values entered: %.0f\t%.0f\t%.0f\t%.0f\t%.0f\t\n", member.get(0),member.get(1),member.get(2),member.get(3),member.get(4));
        System.out.printf("Largest value: %.0f\n", getLargest());
        System.out.printf("Smallest value: %.0f\n", getSmallest());
        System.out.printf("Sum of values entered: %.0f\n", getSum());
        System.out.printf("Average of values entered: %.2f\n", getAverage());

        try {
            System.out.printf("Last value divided by the first value: %.2f\n", divideLastByFirst());
        } catch (ArithmeticException e) {
            System.err.println("Cannot divide by zero (first number was 0).");
        } finally {
            System.out.println("All processing completed!");
        }
    }
}

