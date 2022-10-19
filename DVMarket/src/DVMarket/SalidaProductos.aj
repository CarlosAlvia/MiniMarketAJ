package DVMarket;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
public aspect SalidaProductos {
	pointcut borrar(): call(void Compra.borrarItem(..));
	after() : borrar(){
		try {
		    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		    String fechaYhora= dtf.format(LocalDateTime.now());
            String ruta ="src/DVMarket/market.txt";
            String contenido = "Borrar Item" +fechaYhora;
            File file = new File(ruta);

            if (!file.exists()) {
                file.createNewFile();
            }
            FileWriter fw = new FileWriter(file);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(contenido);
            bw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	 
	 

	 
}
