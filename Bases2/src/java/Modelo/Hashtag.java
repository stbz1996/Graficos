/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author jorge
 */
public class Hashtag {
    private String name;
    private int totalUsers;
    private int totalTweets;
    
    public Hashtag(){}
    
    public void setName(String name){
        this.name = name;
    }
    public void setTotalUsers(int totalUsers){
        this.totalUsers = totalUsers;
    }
    public void setTotalTweets(int totalTweets){
        this.totalTweets = totalTweets;
    }
    
    public String getName(){
        return name;
    }
    public int getTotalUsers(){
        return totalUsers;
    }
    public int getTotalTweets(){
        return totalTweets;
    }
}
