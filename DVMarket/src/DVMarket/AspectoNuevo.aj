package DVMarket;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.aspectj.lang.reflect.MethodSignature;

public aspect AspectoNuevo {
	
	
	pointcut llamarMetodo(): call(* *.buscar*(..));
		after(): llamarMetodo(){
			 MethodSignature signature = (MethodSignature) thisJoinPoint.getSignature();
			 String methodName = signature.getMethod().getName();
			 String nombreObjeto = thisJoinPoint.getTarget().getClass().getName();
			 try {
				 	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
					String fechaHora = dtf.format(LocalDateTime.now());
		            String ruta = "src/consultas.txt";
		            String contenido = ("Nombre del método: "+methodName+" Nombre del objeto: "+nombreObjeto+" Fecha y hora: "+fechaHora+"\n");
		            File file = new File(ruta);
		            if (!file.exists()) {
		               file.createNewFile();
		            }
		            FileWriter fw = new FileWriter(file, true);
		            BufferedWriter bw = new BufferedWriter(fw);
		            bw.write(contenido);
		            bw.close();
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
	}
}