package com.techelevator.model;

public class Choice {

    private int issueId;
    private int choiceId;
    private String choice;
    private int points;

    public Choice() {
    }

    public Choice(int issueId, int choiceId, String choice, int points) {
        this.issueId = issueId;
        this.choiceId = choiceId;
        this.choice = choice;
        this.points = points;
    }

    public int getIssueId() {
        return issueId;
    }

    public void setIssueId(int issueId) {
        this.issueId = issueId;
    }

    public int getChoiceId() {
        return choiceId;
    }

    public void setChoiceId(int choiceId) {
        this.choiceId = choiceId;
    }

    public String getChoice() {
        return choice;
    }

    public void setChoice(String choice) {
        this.choice = choice;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }
}
