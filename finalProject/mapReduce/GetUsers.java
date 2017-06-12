import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
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

public class GetUsers {

    public static class Map extends Mapper<LongWritable, Text, Text, Text>{

        private final ArrayList<String> OriginalHashtags = new ArrayList<>(Arrays.asList("2030now","women","costarica","puravida","makeamericagreatagain","trumprussia","recyclereuse","traficocr"));
        
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

            String user;
            String hashtag;
            String line = value.toString();
            String[] tuple = line.split("\n");
	    
            try{
                for(int i=0;i<tuple.length; i++){

                    //Se obtiene el usuario del tweet
                    JSONObject obj = new JSONObject(tuple[i]);
                    user = obj.getString("User");
                    
                    JSONArray arr = obj.getJSONArray("Hashtags");//Se obtienen los hashtags del tweet
                    
                    for (int j=0; j < arr.length(); j++){

                        //Verifica si el hashtag se encuentra en la lista OriginalHashtags
                        if(OriginalHashtags.contains(arr.get(j).toString())){
			
                            hashtag = arr.get(j).toString();
                            context.write(new Text(hashtag), new Text(user));//Se asigna la llave (hashtag) y el valor (hour)
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
                Set<String> set = new HashSet<>();
                int sumTweets = 0;
                

                //Se obtienen los valores que comparten la llave
                for(Text val : values){
                    set.add(val.toString());
                    sumTweets += 1;                 
                }
                int totalUsers = set.size();
                
                JSONObject obj = new JSONObject();
                obj.put("Hashtag", key.toString());
                obj.put("TotalUsers", totalUsers);
                obj.put("TotalTweets", sumTweets);

                
                context.write(NullWritable.get(), new Text(obj.toString()));//Se agrega el objeto JSON al archivo de salida
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        if (args.length != 2) {
            System.err.println("Usage: GetUsers <in> <out>");
            System.exit(2);
        }

        Job job = new Job(conf, "get users");
        job.setJarByClass(GetUsers.class);
        job.setMapperClass(Map.class);
        job.setReducerClass(Reduce.class);
        job.setMapOutputKeyClass(Text.class);
        job.setMapOutputValueClass(Text.class);
        job.setOutputKeyClass(NullWritable.class);
        job.setOutputValueClass(Text.class);
        job.setInputFormatClass(TextInputFormat.class);
        job.setOutputFormatClass(TextOutputFormat.class);
        job.getConfiguration().set("mapreduce.output.basename","totalUsers");

        FileInputFormat.addInputPath(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, new Path(args[1]));

        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}
