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
public class DistributionHour {
    private String hashtag;
    private int hour;
    private int total;
    
    public DistributionHour(){}
    
    public void setHashtag(String hashtag){
        this.hashtag = hashtag;
    }
    public void setHour(int hour){
        this.hour = hour;
    }
    public void setTotal(int total){
        this.total = total;
    }
    
    public String getHashtag(){
        return hashtag;
    }
    public int getHour(){
        return hour;
    }
    public int getTotal(){
        return total;
    }
    
}
