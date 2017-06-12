/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jorge
 */
public class ModifyFiles {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws FileNotFoundException, IOException {
    	String [] filenames = new String[5];
    	filenames[0] = "/home/jorge/Desktop/finalProject/output_data/output1.json";
        filenames[1] = "/home/jorge/Desktop/finalProject/output_data/output2.json";
	filenames[2] = "/home/jorge/Desktop/finalProject/output_data/output3.json";
	filenames[3] = "/home/jorge/Desktop/finalProject/output_data/output4.json";
	filenames[4] = "/home/jorge/Desktop/finalProject/output_data/output5.json";
        
        for(String filename: filenames){
        	List<String> lines = new ArrayList<>();
        
	        BufferedReader r = new BufferedReader(new FileReader(filename));
	        String in;
	        while((in = r.readLine()) != null)
	            lines.add(in);
	        r.close();
	        
	        int sizeFile = lines.size();
	        PrintWriter w = new PrintWriter(new FileWriter(filename));
	        w.println("[");
	        for(int i = 0; i < sizeFile; i++){
	            //w.println(lines.get(i));
	            String line = lines.get(i);
	            if(i != (sizeFile - 1)){
	                line += ",";
	            }
	            w.println(line);
	        }
	        
	        w.println("]");
	        w.close();
        }
        
    }
    
}
