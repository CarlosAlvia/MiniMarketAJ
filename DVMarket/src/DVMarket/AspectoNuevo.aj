package DVMarket;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.aspectj.lang.reflect.MethodSignature;

public aspect AspectoNuevo {
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
	String fechaHora = dtf.format(LocalDateTime.now());
	
	pointcut llamarMetodo(): call(* *.buscar*(..));
		after(): llamarMetodo(){
			 MethodSignature signature = (MethodSignature) thisJoinPoint.getSignature();
			 String methodName = signature.getMethod().getName();
			 String nombreObjeto = thisJoinPoint.getTarget().getClass().getName();
			 try {
		            String ruta = "src/consultas.txt";
		            String contenido = ("Nombre del método: "+methodName+" Nombre del objeto: "+nombreObjeto+" Fecha y hora: "+fechaHora);
		            File file = new File(ruta);
		            // Si el archivo no existe es creado
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