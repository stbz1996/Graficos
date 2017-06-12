import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;
import org.apache.hadoop.util.GenericOptionsParser;
import org.json.JSONObject;
import org.json.JSONArray;

import javax.security.auth.callback.TextInputCallback;

public class GetHashtags {

    public static class Map extends Mapper <LongWritable, Text, Text, Text>{

        private final ArrayList <String> OriginalHashtags = new ArrayList<>(Arrays.asList("2030now","women","costarica","puravida","makeamericagreatagain","trumprussia","recyclereuse","traficocr"));
        
        //////////////////////////////////////////////////
        //Función: map                                  //
        //                                              //
        //Descripción:                                  //
        //      Ordenar valores con las llaves corres-  //
        //      pondientes.                             //
        //                                              //
        //Entradas:                                     //
        //      key: Llave correspondiente              //
        //      value: Texto del archivo                //
        //      context: Parámetro para actualizar      //
        //               llaves y valores               //
        //                                              //
        //Salida:                                       //
        //      No aplica                               //
        //////////////////////////////////////////////////
        public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException{

            String hashtag;
            String line = value.toString();
            String[] tuple = line.split("\n");
            try{
                for(int i=0;i<tuple.length; i++){
                    JSONObject obj = new JSONObject(tuple[i]);
                    JSONArray arr = obj.getJSONArray("Hashtags");//Se obtienen los hashtags
                    for(int j = 0; j < arr.length(); j++){

                        //Verifica si el hashtag se encuentra en la lista OriginalHashtags
						if(OriginalHashtags.contains(arr.get(j).toString())){
			    			hashtag = arr.get(j).toString();
			    			JSONObject tags = new JSONObject();
                            
                            //Se obtiene la lista de hashtags y se remueve el hashtag
			    			JSONArray arrayTags = obj.getJSONArray("Hashtags");
			    			arrayTags.remove(j);
			    			tags.put("Hashtags",arrayTags);
			    			context.write(new Text(hashtag), new Text(tags.toString()));//Se asigna la llave(hashtag) al valor (conjunto de hashtags)
						}
		    		}
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }



    public static class Reduce extends Reducer<Text,Text,NullWritable,Text>{

        //////////////////////////////////////////////////
        //Función: reduce                               //
        //                                              //
        //Descripción:                                  //
        //      Unir valores que pertenezcan a la misma //
        //      llave.                                  //
        //                                              //
        //Entradas:                                     //
        //      key: Llave correspondiente              //
        //      values: Conjunto de valores que compar- //
        //      ten llave                               //
        //      context: Parámetro para actualizar      //
        //               llaves y valores               //
        //                                              //
        //Salida:                                       //
        //      No aplica                               //
        //////////////////////////////////////////////////

        public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException{

            try{
            	ArrayList<Integer> countHashtags = new ArrayList<>();
                ArrayList<String> arrayHashtags = new ArrayList<>();

                //Se obtienen los valores que comparten la llave	
                for(Text val : values){
               		String line = val.toString();
               		JSONObject obj = new JSONObject(line);
               		JSONArray hashtags = obj.getJSONArray("Hashtags");//Se obtiene el arreglo de hashtags
               		for(int i = 0; i < hashtags.length(); i++){

                        //Verifica si el hashtag se esta repitiendo o no 
               			int pos = arrayHashtags.indexOf(hashtags.get(i));
               			if(pos == -1){
               				countHashtags.add(1);
               				arrayHashtags.add(hashtags.get(i).toString());
               			}
               			else{               				
               				countHashtags.set(pos, (countHashtags.get(pos) + 1));
               			}
               		}
                }

                JSONObject totalHashtags = new JSONObject();
                JSONArray hashtags = new JSONArray();
		        String hashtag = key.toString();

                //Verifica la cantidad de hashtags existentes
                if(countHashtags.size() >= 10){

                    //Recorrido para obtener 10 hashtags
	                for(int i = 1; i <= 10; i++){
	                	int pos = 0;

                        //Se obtiene el hashtag que más se repite
	                	for(int j = 1; j < countHashtags.size(); j++){
	                		if(countHashtags.get(pos) < countHashtags.get(j)){
	                			pos = j;
	                		}
	                	}

                        //Verifica si el hashtag más usado no sea el mismo hashtag
        				if(!(hashtag.equals(arrayHashtags.get(pos)))){
        				   	JSONObject objectHashtag = new JSONObject();
        	                objectHashtag.put("Tag", arrayHashtags.get(pos));
        	                objectHashtag.put("total", countHashtags.get(pos));
        	                hashtags.put(objectHashtag);//Se almacena el objeto JSON con el hashtag obtenida
        					
        				}else i--;

                        //Se remueve el más usado
        	            countHashtags.remove(pos);
        	            arrayHashtags.remove(pos);
    	            }
    	        }

	            else{
	                for(int i = 0; i < arrayHashtags.size(); i++){
				        if(!(hashtag.equals(arrayHashtags.get(i)))){
				   	        JSONObject objectHashtag = new JSONObject();
	                		objectHashtag.put("Tag", arrayHashtags.get(i));
	                		objectHashtag.put("total", countHashtags.get(i));
	                		hashtags.put(objectHashtag);//Se almacena el objeto JSON con el hashtag obtenida
				        }
	                }
	            }
                totalHashtags.put("Hashtag", hashtag);
                totalHashtags.put("TotalHashtags", hashtags);
                context.write(NullWritable.get(), new Text(totalHashtags.toString()));//Se agrega el objeto JSON al archivo de salida
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        if (args.length != 2) {
            System.err.println("Usage: GetHashtags <in> <out>");
            System.exit(2);
        }

        Job job = new Job(conf, "get hashtags");
        job.setJarByClass(GetHashtags.class);
        job.setMapperClass(Map.class);
        job.setReducerClass(Reduce.class);
        job.setMapOutputKeyClass(Text.class);
        job.setMapOutputValueClass(Text.class);
        job.setOutputKeyClass(NullWritable.class);
        job.setOutputValueClass(Text.class);
        job.setInputFormatClass(TextInputFormat.class);
        job.setOutputFormatClass(TextOutputFormat.class);
        job.getConfiguration().set("mapreduce.output.basename","totalHashtags");

        FileInputFormat.addInputPath(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, new Path(args[1]));

        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}
