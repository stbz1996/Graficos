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
public class RelatedHashtag {
    private String hashtag;
    private String relatedHashtag;
    private int total;
    
    public RelatedHashtag(){}
    
    public void setHashtag(String hashtag){
        this.hashtag = hashtag;
    }
    public void setRelatedHashtag(String relatedHashtag){
        this.relatedHashtag = relatedHashtag;
    }
    public void setTotal(int total){
        this.total = total;
    }
    
    public String getHashtag(){
        return hashtag;
    }
    public String getRelatedHashtag(){
        return relatedHashtag;
    }
    public int getTotal(){
        return total;
    }
}
