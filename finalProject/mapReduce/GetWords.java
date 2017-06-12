import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Set;
import java.util.HashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.IntWritable;
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


public class GetWords{

	public static class Map extends Mapper <LongWritable, Text, Text,Text>{

		private final ArrayList <String> OriginalHashtags = new ArrayList<>(Arrays.asList("2030now","women","costarica","puravida","makeamericagreatagain","trumprussia","recyclereuse","traficocr"));
		private final String[] specialChars = new String[] {"¡","!","¿","?","(",")",",",".",";",":", "/","[","]","{","}"};
		private final String[] spanishPrepositions = new String[]{"a", "ante", "bajo","cabe","con", "contra","de","desde", "durante","en","entre","hacia","hasta","para","por","segun", "sin","so",
																	"sobre","tras","via"};
		private final String [] englishPrepositions = new String[]{"about","as","at","but","by","down","for","from", "in", "into", "like","near","next", "of", "off","on","onto","out","over","past","plus",
																	"minus","since","than","to","up","with"};
		private final Set <String> invalidChars = new HashSet<String>(Arrays.asList("http","0","1","2","3","4","5","6","7","8","9","#","$","%","&","+"," ","@"));

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

		public void map (LongWritable key, Text value, Context context) throws IOException, InterruptedException{

			String message, hashtag;
			String [] words;
			ArrayList <String> finalWords = new ArrayList();
			String line = value.toString();
			String[] tuple = line.split("\n");
			try{
				for(int i = 0; i < tuple.length; i++){
					JSONObject obj = new JSONObject(tuple[i]);
					message = obj.getString("Message");//Se obtiene el tweet

					//Se limpia el mensaje de algunos caracteres innecesarios
					for(String specialChar: specialChars){
						message = message.replace(specialChar," ");
					}
					words = message.split(" ");

					for(String word:words){

						//Se verifica si el mensaje contiene otro tipo de caracteres innecesarios
						if(!containsChar(word)){
							finalWords.add(word);
						}
					}

					JSONArray arr = obj.getJSONArray("Hashtags");//Se obtienen los hashtags del tweet
					for(int j = 0; j < arr.length(); j++){

						//Verifica si el hashtag se encuentra en la lista OriginalHashtags 
						if(OriginalHashtags.contains(arr.get(j).toString())){
							hashtag = arr.get(j).toString();
							JSONObject wordsMessage = new JSONObject();
							JSONArray arrayWords = new JSONArray(finalWords);
							wordsMessage.put("Words", arrayWords);
							context.write(new Text(hashtag), new Text(wordsMessage.toString()));//Se asigna la llave(hashtag) al valor (conjunto de palabras)
						}
					}
				}

			}catch(Exception e){
				e.printStackTrace();
			}
		}

		//Función que verifica si la palabra contiene ciertos caracteres no permitidos
		public Boolean containsChar(String word){
			for(String invalidChar:invalidChars){
				if(word.contains(invalidChar)){
					return true;
				}
			}
			//Verifica si la palabra es una preposición del idioma inglés o español
			if((word.length() <= 4) || Arrays.asList(spanishPrepositions).contains(word) || Arrays.asList(englishPrepositions).contains(word)){
				return true;
			}else{
				return false;
			}
		}
	}


	public static class Reduce extends Reducer<Text,Text, NullWritable, Text>{

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

		public void reduce (Text key, Iterable<Text> values, Context context) throws IOException,InterruptedException{

			try{
				ArrayList<Integer> countWords = new ArrayList<>();
				ArrayList<String> arrayWords = new ArrayList<>();

				//Se obtienen los valores que comparten la llave
				for(Text val: values){
					String line = val.toString();
					JSONObject obj = new JSONObject(line);
					JSONArray words = obj.getJSONArray("Words");//Se obtiene el arreglo de palabras
					for(int i = 0; i < words.length(); i++){

						//Verifica si la palabra se esta repitiendo o no 
						int pos = arrayWords.indexOf(words.get(i));
						if(pos == -1){
							countWords.add(1);
							arrayWords.add(words.get(i).toString());
						}else{
							countWords.set(pos, (countWords.get(pos) + 1));
						}
					}
				}

				JSONObject totalWords = new JSONObject();
				JSONArray words = new JSONArray();

				//Verifica la cantidad de palabras existentes
				if(countWords.size() >= 10){

					//Recorrido para obtener 10 palabras
					for(int i = 1; i <= 10; i++){
						int pos = 0;

						//Se obtiene la palabra que más se repite
						for(int j = 1; j < countWords.size(); j++){
							if(countWords.get(pos) < countWords.get(j)){
								pos = j;
							}
						}
						JSONObject objectWord = new JSONObject();
						objectWord.put("Word", arrayWords.get(pos));
						objectWord.put("Total", countWords.get(pos));
						words.put(objectWord);	//Se almacena el objeto JSON con la palabra obtenida

						//Se remueve el más usado
						countWords.remove(pos);
						arrayWords.remove(pos);
					}
				}
				else{
					for(int i = 0; i < arrayWords.size(); i++){
						JSONObject objectWord = new JSONObject();
						objectWord.put("Word", arrayWords.get(i));
						objectWord.put("Total", countWords.get(i));
						words.put(objectWord);	//Se almacena el objeto JSON con la palabra obtenida
					}
				}
				totalWords.put("Hashtag", key.toString());
				totalWords.put("TotalWords", words);
				context.write(NullWritable.get(), new Text(totalWords.toString()));//Se agrega el objeto JSON al archivo de salida

			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}


	public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        if (args.length != 2) {
            System.err.println("Usage: GetWords <in> <out>");
            System.exit(2);
        }

        Job job = new Job(conf, "get words");
        job.setJarByClass(GetWords.class);
        job.setMapperClass(Map.class);
        job.setReducerClass(Reduce.class);
        job.setMapOutputKeyClass(Text.class);
        job.setMapOutputValueClass(Text.class);
        job.setOutputKeyClass(NullWritable.class);
        job.setOutputValueClass(Text.class);
        job.setInputFormatClass(TextInputFormat.class);
        job.setOutputFormatClass(TextOutputFormat.class);
        job.getConfiguration().set("mapreduce.output.basename","totalWords");

        FileInputFormat.addInputPath(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, new Path(args[1]));

        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}