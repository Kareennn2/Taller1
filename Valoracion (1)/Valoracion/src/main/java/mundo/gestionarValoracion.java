/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mundo;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author Sistemas
 */
public class gestionarValoracion {
    ArrayList<Valoracion> misValoraciones = new ArrayList<>();
    
/**
 * metodo para agregar una nueva valoracion a la contenedora
 * @param nombre
 * @param fecha
 * @param correo
 * @param negocio
 * @param puntuacion 
 */
    public void agregarValoracion(String nombre, String fecha,String correo, String negocio, String puntuacion)
    {
        Valoracion miValoracion = new Valoracion(nombre,fecha,correo,negocio,puntuacion);
        misValoraciones.add(miValoracion);
        
        /*for(Valoracion v:misValoraciones)
        {
            System.out.println("nombre: "+v.getNombre());
            System.out.println("fecha: "+v.getFecha());
            System.out.println("correo: "+v.getCorreo());
            System.out.println("negocio: "+v.getNegocio());
            System.out.println("puntuación: "+v.getPuntuacion());
            System.out.println("------------------------------------");
        }*/   
    }
    /**
     * Metodo que permite listar los datos de la
     * contenedora variable
     * @return toda la contenedora
     */
    public List<Valoracion> listarValoraciones()
    {
        return misValoraciones;
    }
    
    public void eliminarValoracion(String id)
    {
        //utiliza un iterador para recorrer la contenedora variable
        Iterator<Valoracion> it = misValoraciones.iterator();
        boolean eliminado = false; // Para verificar si se eliminó algo
        //Recorrer la lista de valoraciones
        while(it.hasNext())
        {
            Valoracion v = it.next();
            if(v.getCorreo().equals(id))
            {
                 it.remove();
                 eliminado=true;
                 break;
            }
        }
        
    }
    public void editarValoracion(String nombre, String fecha,String correo, String negocio, String puntuacion)
    {
            // Buscar la valoración en la lista por el correo, que asumo es único
    for (Valoracion v : misValoraciones) {
        if (v.getCorreo().equals(correo)) {
            // Actualizamos los valores de la valoración existente
            v.setNombre(nombre);
            v.setFecha(fecha);
            v.setNegocio(negocio);
            v.setPuntuacion(puntuacion);
System.out.println("Valoración editada: " + v);
break;
        }
    }
    
    }
       
}
