package bases;

import java.util.Calendar;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
/**
 *
 * @author Andrew
 */
public class Bases {
    public static void correr(String archivo) throws FileNotFoundException, IOException {
        String cadena;
        FileReader f = new FileReader(archivo);
        BufferedReader b = new BufferedReader(f);
        while((cadena = b.readLine())!=null) {
            try {  
            Process p = Runtime.getRuntime().exec(cadena);  
            BufferedReader in = new BufferedReader(  
                                new InputStreamReader(p.getInputStream()));  
            String line = null;  
            while ((line = in.readLine()) != null) {  
                System.out.println(line);  
            }  
            } catch (IOException e) {  
            e.printStackTrace();  
            }
            //System.out.println(cadena);
        }
        b.close();
    }
    
    
    public static void main(String[] args) throws IOException {
        int hora,minutos,segundos;
        int horatxt, mintxt, segtxt;
        String tipo;
        //muestraContenido("/Users/Andrew/Documents/NetBeansProjects/Bases/hora.txt");
        FileReader f = new FileReader("/Users/Andrew/Documents/NetBeansProjects/Bases/hora.txt");
        BufferedReader b = new BufferedReader(f);
        horatxt = Integer.parseInt(b.readLine());
        mintxt = Integer.parseInt(b.readLine());
        segtxt = Integer.parseInt(b.readLine());
        FileReader a = new FileReader("/Users/Andrew/Documents/NetBeansProjects/Bases/politica.txt");
        BufferedReader c = new BufferedReader(a);
        tipo = c.readLine();
       // Calendar calendario = Calendar.getInstance();
        boolean bandera = true;      
        while(bandera){
            Calendar calendario = Calendar.getInstance();
            hora = calendario.get(Calendar.HOUR_OF_DAY);
            minutos = calendario.get(Calendar.MINUTE);
            segundos = calendario.get(Calendar.SECOND);
            if(hora > 12)
                hora = hora - 12;
            //System.out.println(hora + " " + minutos + " " + segundos);
            if(horatxt == hora && mintxt == minutos && segtxt == segundos){
                if(tipo.equals("full")){
                    correr("/Users/Andrew/Documents/NetBeansProjects/Bases/codigo.txt");
                    bandera = false;
                }
            }
        }        
    }
}
