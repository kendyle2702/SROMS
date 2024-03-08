
package Models;

public class PrizeStructure {
    private int prizeStructureID;
    private int first;
    private int second;
    private int third;
    private int encouragement;

    public PrizeStructure(int prizeStructureID, int first, int second, int third, int encouragement) {
        this.prizeStructureID = prizeStructureID;
        this.first = first;
        this.second = second;
        this.third = third;
        this.encouragement = encouragement;
    }

    public int getPrizeStructureID() {
        return prizeStructureID;
    }

    public void setPrizeStructureID(int prizeStructureID) {
        this.prizeStructureID = prizeStructureID;
    }

    public int getFirst() {
        return first;
    }

    public void setFirst(int first) {
        this.first = first;
    }

    public int getSecond() {
        return second;
    }

    public void setSecond(int second) {
        this.second = second;
    }

    public int getThird() {
        return third;
    }

    public void setThird(int third) {
        this.third = third;
    }

    public int getEncouragement() {
        return encouragement;
    }

    public void setEncouragement(int encouragement) {
        this.encouragement = encouragement;
    }
    
}
