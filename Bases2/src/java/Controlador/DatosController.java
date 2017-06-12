
package Controlador;

import Modelo.*;
import java.util.ArrayList;

public class DatosController {
    public ArrayList<Integer> dato1 = new ArrayList<Integer>();
    public ArrayList<String> dato2 = new ArrayList<String>();
    
    public ArrayList<consultaGeneral> consulta6(){
        ArrayList<consultaGeneral> datos = new ArrayList<consultaGeneral>();
        Conexion conexion = new Conexion();
        try{
            ArrayList<ArrayList<RelatedHashtag>> groupRelatedHashtags = conexion.listarHashtagsRelacionados();
            for(int i = 0; i < groupRelatedHashtags.size(); i++){
                consultaGeneral consulta = new consultaGeneral();
                consulta.hastag = groupRelatedHashtags.get(i).get(0).getHashtag();
                for(int j = 0; j < groupRelatedHashtags.get(i).size(); j++){
                    consulta.cantidad.add(groupRelatedHashtags.get(i).get(j).getTotal());
                    consulta.palabras.add(groupRelatedHashtags.get(i).get(j).getRelatedHashtag());
                }
                datos.add(consulta);
            }
            return datos;
            
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public ArrayList<Controlador.consultaGeneral> consulta5(){
        ArrayList<consultaGeneral> datos = new ArrayList<consultaGeneral>();
        Conexion conexion = new Conexion();
        try{
            ArrayList<ArrayList<DistributionHour>> groupDistributionHour = conexion.listarHoras();
            
            for(int i = 0; i < groupDistributionHour.size(); i++){
                consultaGeneral consulta = new consultaGeneral();
                consulta.hastag = groupDistributionHour.get(i).get(0).getHashtag();
                for(int j = 0; j < groupDistributionHour.get(i).size(); j++){
                    consulta.cantidad.add(groupDistributionHour.get(i).get(j).getTotal());
                    consulta.palabras.add( String.valueOf(groupDistributionHour.get(i).get(j).getHour()));
                }
                datos.add(consulta);
            }
            return datos;
            
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public ArrayList<Controlador.consultaGeneral> consulta4(){
       ArrayList<consultaGeneral> datos = new ArrayList<consultaGeneral>();
       Conexion conexion = new Conexion();
       try{
            ArrayList<ArrayList<NewHashtag>> groupNewHashtags = conexion.listarHashtag();
            
            for(int i = 0; i < groupNewHashtags.size(); i++){
                consultaGeneral consulta = new consultaGeneral();
                consulta.hastag = groupNewHashtags.get(i).get(0).getHashtag();
                for(int j = 0; j < groupNewHashtags.get(i).size(); j++){
                    consulta.cantidad.add(groupNewHashtags.get(i).get(j).getTotal());
                    consulta.palabras.add(groupNewHashtags.get(i).get(j).getNewHashtag());
                }
                datos.add(consulta);
            }
            return datos;
            
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public ArrayList<Controlador.consultaGeneral> consulta3(){
       ArrayList<consultaGeneral> datos = new ArrayList<consultaGeneral>();
       Conexion conexion = new Conexion();       
       try{
            ArrayList<ArrayList<Word>> groupWords = conexion.listarPalabras();
            
            for(int i = 0; i < groupWords.size(); i++){
                consultaGeneral consulta = new consultaGeneral();
                consulta.hastag = groupWords.get(i).get(0).getHashtag();
                for(int j = 0; j < groupWords.get(i).size(); j++){
                    consulta.cantidad.add(groupWords.get(i).get(j).getTotal());
                    consulta.palabras.add(groupWords.get(i).get(j).getWord());
                }
                datos.add(consulta);
            }
            return datos;
            
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
       
    public void consulta2(){
       this.dato1.clear();
       this.dato2.clear();
       
       try{
           Conexion conexion = new Conexion();
            ArrayList<Hashtag> hashtags = conexion.listar();
            for(Hashtag hashtag: hashtags){
                dato1.add(hashtag.getTotalTweets());
                dato2.add(hashtag.getName());
            }
       }catch(Exception e){
           e.printStackTrace();
       }
    }
    
    public void consulta1(){
        this.dato1.clear();
        this.dato2.clear();
        try{
             Conexion conexion = new Conexion();
            ArrayList<Hashtag> hashtags = conexion.listar();
            for(Hashtag hashtag: hashtags){
                dato1.add(hashtag.getTotalUsers());
                dato2.add(hashtag.getName());
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}