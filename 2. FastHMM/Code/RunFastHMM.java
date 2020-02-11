// Import required java classes
import com.graphhopper.GraphHopper;
import com.graphhopper.matching.EdgeMatch;
import com.graphhopper.matching.GPXFile;
import com.graphhopper.matching.MapMatching;
import com.graphhopper.matching.MatchResult;
import com.graphhopper.reader.osm.GraphHopperOSM;
import com.graphhopper.routing.AlgorithmOptions;
import com.graphhopper.routing.util.CarFlagEncoder;
import com.graphhopper.routing.util.EncodingManager;
import com.graphhopper.routing.weighting.FastestWeighting;
import com.graphhopper.routing.weighting.Weighting;
import com.graphhopper.util.GPXEntry;
import com.graphhopper.util.Parameters;
import com.graphhopper.routing.VirtualEdgeIteratorState;
import com.graphhopper.util.EdgeIteratorState;
import com.graphhopper.util.CmdArgs;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.lang.*;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;
import com.graphhopper.osmidexample.MyGraphHopper;
import java.io.FileWriter;


public class RunFastHMM {

	private List<String> files = new ArrayList();
	  public static void main(String[] args) throws Exception {
	    
	    // Read all files from the data folder
	    File folder = new File("../../Test");
	    
	    // List all files from the folder
      RunFastHMM listFiles = new RunFastHMM();
	    listFiles.listAllFiles(folder);
	  }
	  
	  public void listAllFiles(File folder) throws Exception {
	    File[] fileNames = folder.listFiles();
	    
	    // Loop though all files in the data folder
	    for(File file : fileNames) {
      	  try {
	          if(file.isDirectory()) {
	            listAllFiles(file);
	          }
	          else {
	            // Loop through the four routing algorithms
	            String[] algos = {"astar", "astarbi", "dijkstra", "dijkstrabi"};
	            for(String algorithm : algos) {
  	         	  files.add(file.toPath().toString());
  	         	  
  	         	  // Initiate an instance of Graphhopper, set location of OSM data, set parameters
  	         	  MyGraphHopper hopper = new MyGraphHopper();
  	          	hopper.setDataReaderFile("hopper/montreal-latest.osm.pbf");
  	          	hopper.setGraphHopperLocation("hopper/");
  	          	CarFlagEncoder encoder = new CarFlagEncoder();
  	          	hopper.setEncodingManager(new EncodingManager(encoder));
  	          	hopper.getCHFactoryDecorator().setEnabled(false);
  	          	hopper.importOrLoad();
  	          	Weighting weighting = new FastestWeighting(encoder);
  	          	AlgorithmOptions algoOptions = new AlgorithmOptions(algorithm, weighting);
                
                // Format file names
  	          	String str1 = file.toPath().toString();
  	          	String str2= str1.replace("../../Test/", "");
                String str3 = str2.substring(0,str2.lastIndexOf("/"));
                String str4 = str2.replace(".gpx", ".txt");	          	
  	          	
  	          	double startTime = System.currentTimeMillis();
  	          	
  	          	// Run the map matching procedure
  	          	MapMatching mapMatching = new MapMatching(hopper, algoOptions);
  	          	mapMatching.setMeasurementErrorSigma(10);
  
  	          	List<GPXEntry> inputGPXEntries = new GPXFile().doImport(str1).getEntries();
  	          	MatchResult mr = mapMatching.doWork(inputGPXEntries);
  	          	
  	          	// Calculate run time
  	          	double endTime = System.currentTimeMillis();
  	          	double totalTime = (endTime - startTime)/1000;
  							
  							// Output GPX file										
  	          	//GPXFile gpxFile = new GPXFile(mr, null);
                File  f = new File("../TestResults - " + algorithm +"/" + str3);
                f.mkdirs();
  	          	//gpxFile.doExport("../TestResults - " + algorithm +"/" + str2);
  	          	
  	          	// Generate data for text file
  	          	List<EdgeMatch> matches = mr.getEdgeMatches();
  	          	matches.get(0).getEdgeState();
  	          	
  	          	// Output text file
  	          	//PrintStream PrintStream = new PrintStream(new FileOutputStream("../TestResults - " + algorithm +"/" + str4));
  	          	//System.setOut(PrintStream);																		
  	          	//System.out.println(matches);
  	          	//PrintStream.close();
  	          	
  	          	// Output run time
  	          	String str5 = str4.replace(".txt","_time.txt");
  	          	PrintStream PPrintStream = new PrintStream(new FileOutputStream("../TestResults - " + algorithm +"/" + str5));
  	          	System.setOut(PPrintStream);																		
  	          	System.out.println(totalTime);
  	          	PPrintStream.close();
  
                // Format output
                //for (edge : mr.getEdgeMatches()){
                //    int edgeId = edge.getEdge();
                //    String vInfo = "";
                //    if (edge instanceof VirtualEdgeIteratorState) {
                //        // first, via and last edges can be virtual
                //        VirtualEdgeIteratorState vEdge = (VirtualEdgeIteratorState) edge;
                //        edgeId = vEdge.getOriginalTraversalKey() / 2;
                //        vInfo = "v";
                //    }
                
                List edgeList = new ArrayList<Integer>();
                long link1 = 0;
                long link2 = 0;
                FileWriter csvWriter = new FileWriter("../TestResults - " + algorithm +"/" + str4.replace(".txt", ".csv"));

                for(EdgeMatch em:matches){
	                EdgeIteratorState edge = em.getEdgeState();
	                int edgeId = edge.getEdge();
                  String vInfo = "";
                  if (edge instanceof VirtualEdgeIteratorState) {
                    // first, via and last edges can be virtual
                    VirtualEdgeIteratorState vEdge = (VirtualEdgeIteratorState) edge;
                    edgeId = vEdge.getOriginalTraversalKey() / 2;
                    vInfo = "v";
                  }
                  
                  link2 = hopper.getOSMWay(edgeId);
                  if (link1 != link2){
                    csvWriter.append(Long.toString(link2));
                    csvWriter.append("\n");
                  }
                  link1=link2;
                
                

                }
                csvWriter.flush();
                csvWriter.close();
                //PrintStream PPPrintStream = new PrintStream(new FileOutputStream("../TestResults - " + algorithm +"/" + str4));
  	          	//System.setOut(PPPrintStream);	
  	          	//System.out.println(edgeList);
  	          	//PPPrintStream.close();
  
              }
  	        }
	        } 
	        catch(Exception e) {
	   		  } continue;
     }
	 }
}	 