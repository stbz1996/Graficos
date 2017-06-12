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
public class Word {
    private String hashtag;
    private String word;
    private int total;
    
    public Word(){}
    
    public void setHashtag(String hashtag){
        this.hashtag = hashtag;
    }
    public void setWord(String word){
        this.word = word;
    }
    public void setTotal(int total){
        this.total = total;
    }
    
    public String getHashtag(){
        return hashtag;
    }
    public String getWord(){
        return word;
    }
    public int getTotal(){
        return total;
    }
}
