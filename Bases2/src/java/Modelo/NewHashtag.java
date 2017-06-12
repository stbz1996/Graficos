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
public class NewHashtag {
    private String hashtag;
    private String newHashtag;
    private int total;
    
    public NewHashtag(){};
    
    public void setHashtag(String hashtag){
        this.hashtag = hashtag;
    }
    public void setNewHashtag(String newHashtag){
        this.newHashtag = newHashtag;
    }
    public void setTotal(int total){
        this.total = total;
    }
    
    public String getHashtag(){
        return hashtag;
    }
    public String getNewHashtag(){
        return newHashtag;
    }
    public int getTotal(){
        return total;
    }
}
