package streamingtweets;

import java.io.FileWriter;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import twitter4j.FilterQuery;
import twitter4j.StallWarning;
import twitter4j.Status;
import twitter4j.StatusDeletionNotice;
import twitter4j.StatusListener;
import twitter4j.TwitterStream;
import twitter4j.TwitterStreamFactory;
import twitter4j.conf.ConfigurationBuilder;

//Clase que obtiene tweets por medio de conexión del API de Twitter

public class StreamingTweets {

    public static void main(String[] args) {
        String[] hashtags = new String[]{"2030NOW","WOMEN","COSTARICA","PURAVIDA","MAKEAMERICAGREATAGAIN","TRUMPRUSSIA","REYCLEREUSE","TRAFICOCR"};
        ConfigurationBuilder configurationBuilder = new ConfigurationBuilder();
        
        //Asignar llaves del api
        configurationBuilder.setDebugEnabled(true)
                .setOAuthConsumerKey("14LBUyva9F3FG95IcmRHiiX4e")
                .setOAuthConsumerSecret("x5l9zkHIpXYu1OAzV1szErzFOTvnvqQeSwQruu1fhUdXCt43uQ")
                .setOAuthAccessToken("865079716037894144-IVNmqWilTEisL5seqX8pFXjGZBZ99s8")
                .setOAuthAccessTokenSecret("jHkvTohvjkrmPAH2hkvGA1qZrr90YyStUbx5Ie301Geb3");
        
        TwitterStream twitterStream = new TwitterStreamFactory(configurationBuilder.build()).getInstance();
        
        try{
            FileWriter file = new FileWriter("/home/jorge/Desktop/testfile.txt");
            twitterStream.addListener(new StatusListener(){
                //Se obtienen los tweets que se encuentran activos
                @Override
                public void onStatus(Status status){
                    
                    int countHashtags = status.getHashtagEntities().length;
                    //Verifica si el tweet posee Hashtags
                    if (countHashtags != 0){
                        boolean hashtagInTweet = false;
                        
                        //Verifica si algún hashtag pertenece a la lista hashtags
                        for (int i = 0; i < countHashtags; i++){
                            for(int j = 0; j < hashtags.length; j++){
                                if(status.getHashtagEntities()[i].getText().toUpperCase().equals(hashtags[j].toUpperCase())){
                                    hashtagInTweet = true;
                                }
                            }
                        }
                        if(hashtagInTweet){
                            JSONObject object = new JSONObject();
                            JSONArray hashtagArray = new JSONArray();

                            object.put("User", status.getUser().getScreenName());
                            object.put("Creation", status.getCreatedAt().toString());
                            
                            //Se almacenan todos los hashtags
                            for (int i = 0; i < countHashtags; i++){
                               hashtagArray.add(status.getHashtagEntities()[i].getText().toLowerCase());
                            }
                            object.put("Hashtags",hashtagArray);
                            
                            //Verifica si es tweet o re-tweet
                            if (status.isRetweet()){
                                object.put("Message", status.getRetweetedStatus().getText());
                            }else{
                                object.put("Message", status.getText());
                            }
                            
                            try{

                                file.write(object.toJSONString()+"\n");
                                file.flush();
                            }
                            catch(Exception e){
                                e.printStackTrace();
                            }
                            
                        }
                    }
                }

                @Override
                public void onDeletionNotice(StatusDeletionNotice sdn) {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }

                @Override
                public void onTrackLimitationNotice(int i) {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }

                @Override
                public void onScrubGeo(long l, long l1) {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }

                @Override
                public void onStallWarning(StallWarning sw) {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }

                @Override
                public void onException(Exception excptn) {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }

            });
            
            //Filtrar tweets con los hashtags que se ocupan
            FilterQuery tweetFilterQuery = new FilterQuery();
            tweetFilterQuery.track(hashtags);
            twitterStream.filter(tweetFilterQuery);

            }catch(Exception e){
                e.printStackTrace();
            }
        
        
    }
    
}

