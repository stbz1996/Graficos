package Modelo;
import java.sql.*;
import java.util.ArrayList;
import Controlador.DatosController;

public class Conexion {
    private Connection conn;
    private Statement state;
    
    public void conexion(){
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto","root","1234");
            state = conn.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<Hashtag> listar() throws Exception{
        conexion();                                                             // Inicia conexion con BD
        ResultSet rs = state.executeQuery("SELECT hashtagName, countUsers,countTweets FROM Hashtag");                // Hace la llamada
        ArrayList<Hashtag> hashtags = new ArrayList<>();                 // Listado de datos
        while(rs.next()){
            Hashtag hashtag = new Hashtag();
            hashtag.setName((String) rs.getObject(1));
            hashtag.setTotalUsers((Integer) rs.getObject(2));
            hashtag.setTotalTweets((Integer) rs.getObject(3));
            hashtags.add(hashtag);            
        }
        return hashtags;
    }
    
    public ArrayList<ArrayList<Word>> listarPalabras()throws Exception{
        conexion();
        ResultSet rs = state.executeQuery("SELECT hashtag, word, total FROM Word ORDER BY hashtag, total DESC");
        ArrayList<ArrayList<Word>> groupWords = new ArrayList<>();
        ArrayList<Word> words = new ArrayList<>();
        int counter = 0;
        
        while(rs.next()){
            if((counter % 10 == 0) && (counter > 0)){
                groupWords.add(words);
                words = new ArrayList<>();
            }
            Word word = new Word();
            word.setHashtag((String) rs.getObject(1));
            word.setWord((String) rs.getObject(2));
            word.setTotal((Integer) rs.getObject(3));
            words.add(word);
            counter += 1;
        }
        groupWords.add(words);
        return groupWords;
    }
    
    public ArrayList<ArrayList<NewHashtag>> listarHashtag() throws SQLException{
        conexion();
        ResultSet rs = state.executeQuery("SELECT hashtag, newHashtag, total FROM NewHashtag ORDER BY hashtag, total DESC");
        ArrayList<ArrayList<NewHashtag>> groupNewHashtags = new ArrayList<>();
        ArrayList<NewHashtag> newHashtags = new ArrayList<>();
        int counter = 0;
        
        while(rs.next()){
            if((counter % 10 == 0) && (counter > 0)){
                groupNewHashtags.add(newHashtags);
                newHashtags = new ArrayList<>();
            }
            NewHashtag newHashtag = new NewHashtag();
            newHashtag.setHashtag((String) rs.getObject(1));
            newHashtag.setNewHashtag((String) rs.getObject(2));
            newHashtag.setTotal((Integer) rs.getObject(3));
            newHashtags.add(newHashtag);
            counter += 1;
        }
        groupNewHashtags.add(newHashtags);
        return groupNewHashtags;
    }
    
    public ArrayList<ArrayList<DistributionHour>> listarHoras()throws SQLException{
        conexion();
        ResultSet rs = state.executeQuery("SELECT hashtag, hour, total FROM DistributionTime ORDER BY hashtag, hour ASC");
        ArrayList<ArrayList<DistributionHour>> groupDistributionHours = new ArrayList<>();
        ArrayList<DistributionHour> distributionHours = new ArrayList<>();
        int counter = 0;
        
        while(rs.next()){
            if((counter % 24 == 0) && (counter > 0)){
                groupDistributionHours.add(distributionHours);
                distributionHours = new ArrayList<>();
            }
            DistributionHour distributionHour = new DistributionHour();
            distributionHour.setHashtag((String) rs.getObject(1));
            distributionHour.setHour((int) rs.getObject(2));
            distributionHour.setTotal((int) rs.getObject(3));
            distributionHours.add(distributionHour);
            counter += 1;
        }
        groupDistributionHours.add(distributionHours);
        return groupDistributionHours;
    }
    
    public ArrayList<ArrayList<RelatedHashtag>> listarHashtagsRelacionados()throws SQLException{
        conexion();
        ResultSet rs = state.executeQuery("SELECT hashtag, relatedHashtag, total FROM RelatedHashtag ORDER BY hashtag, relatedHashtag");
        ArrayList<ArrayList<RelatedHashtag>> groupRelatedHashtags = new ArrayList<>();
        ArrayList<RelatedHashtag> relatedHashtags = new ArrayList<>();
        
        String hashtag = "";
        while(rs.next()){
            if(!hashtag.equals(rs.getObject(1))){
                groupRelatedHashtags.add(relatedHashtags);
                if(hashtag.equals("")){
                    groupRelatedHashtags.remove(0);
                }
                relatedHashtags = new ArrayList<>();
                hashtag = (String) rs.getObject(1);
            }
            
            RelatedHashtag relatedHashtag = new RelatedHashtag();
            relatedHashtag.setHashtag(hashtag);
            relatedHashtag.setRelatedHashtag((String) rs.getObject(2));
            relatedHashtag.setTotal((int) rs.getObject(3));
            relatedHashtags.add(relatedHashtag);
        }
        groupRelatedHashtags.add(relatedHashtags);
        return groupRelatedHashtags;
    }
}
