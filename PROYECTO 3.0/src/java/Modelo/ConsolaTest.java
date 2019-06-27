/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.FileNotFoundException;

/**
 *
 * @author lordp
 */
public class ConsolaTest {
    
    public static void main(String[] args) throws FileNotFoundException
    {
        BD bd = new BD();
        
                                               System.out.println(bd.insertarImagen("images\\tipo_producto\\clavos.jpg",
               "tipo_producto", "tipoprod_imagen", "101", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\cable.jpg",
               "tipo_producto", "tipoprod_imagen", "104", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\tuberia.jpg",
               "tipo_producto", "tipoprod_imagen", "106", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\plagas.jpg",
               "tipo_producto", "tipoprod_imagen", "107", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\tuercas.jpg",
               "tipo_producto", "tipoprod_imagen", "102", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\tornillos.jpg",
               "tipo_producto", "tipoprod_imagen", "103", "id_tipoprod"));
        /* INSERTS IMAGENES TIPO PROD 
                                          System.out.println(bd.insertarImagen("images\\tipo_producto\\cemento.jpg",
               "tipo_producto", "tipoprod_imagen", "108", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\tabique.jpg",
               "tipo_producto", "tipoprod_imagen", "109", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\alambres.jpg",
               "tipo_producto", "tipoprod_imagen", "110", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\aislantes.jpg",
               "tipo_producto", "tipoprod_imagen", "111", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\cadenas.jpg",
               "tipo_producto", "tipoprod_imagen", "112", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\cuerdas.jpg",
               "tipo_producto", "tipoprod_imagen", "113", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\acce construccion.jpg",
               "tipo_producto", "tipoprod_imagen", "114", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\alicates.jpg",
               "tipo_producto", "tipoprod_imagen", "115", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\dados.jpg",
               "tipo_producto", "tipoprod_imagen", "116", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\desatornilladores.jpg",
               "tipo_producto", "tipoprod_imagen", "117", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\serruchos.jpg",
               "tipo_producto", "tipoprod_imagen", "118", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\martillos.jpg",
               "tipo_producto", "tipoprod_imagen", "119", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\prensas.jpg",
               "tipo_producto", "tipoprod_imagen", "120", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\set herramientas.jpg",
               "tipo_producto", "tipoprod_imagen", "121", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\canalizacion.jpg",
               "tipo_producto", "tipoprod_imagen", "122", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\alargadores.jpg",
               "tipo_producto", "tipoprod_imagen", "123", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\temporizador.jpg",
               "tipo_producto", "tipoprod_imagen", "124", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\prot electricistas.jpg",
               "tipo_producto", "tipoprod_imagen", "125", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\cajas de distribucion.jpg",
               "tipo_producto", "tipoprod_imagen", "126", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\enchufes.jpg",
               "tipo_producto", "tipoprod_imagen", "127", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\pasacables.jpg",
               "tipo_producto", "tipoprod_imagen", "128", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\pintura exterior.jpg",
               "tipo_producto", "tipoprod_imagen", "129", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\pintura interior.png",
               "tipo_producto", "tipoprod_imagen", "130", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\pintura en spray.jpg",
               "tipo_producto", "tipoprod_imagen", "131", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\diluyente.jpg",
               "tipo_producto", "tipoprod_imagen", "132", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\herramientas pintor.jpg",
               "tipo_producto", "tipoprod_imagen", "133", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\barnices.jpg",
               "tipo_producto", "tipoprod_imagen", "134", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\texturas muros.jpg",
               "tipo_producto", "tipoprod_imagen", "135", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\extractores.jpg",
               "tipo_producto", "tipoprod_imagen", "136", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\percheros.jpg",
               "tipo_producto", "tipoprod_imagen", "137", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\flexible.jpg",
               "tipo_producto", "tipoprod_imagen", "138", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\llave baño.jpg",
               "tipo_producto", "tipoprod_imagen", "139", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\destapes.jpg",
               "tipo_producto", "tipoprod_imagen", "140", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\griferia ducha.jpg",
               "tipo_producto", "tipoprod_imagen", "141", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\fertilizantes.jpg",
               "tipo_producto", "tipoprod_imagen", "142", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\maceteros.jpg",
               "tipo_producto", "tipoprod_imagen", "143", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\cercos.jpg",
               "tipo_producto", "tipoprod_imagen", "144", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\mangueras.jpg",
               "tipo_producto", "tipoprod_imagen", "145", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\tijeras.jpg",
               "tipo_producto", "tipoprod_imagen", "146", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\rastrillo.png",
               "tipo_producto", "tipoprod_imagen", "147", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\ampolletas.jpg",
               "tipo_producto", "tipoprod_imagen", "148", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\focos.jpg",
               "tipo_producto", "tipoprod_imagen", "149", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\tubos.png",
               "tipo_producto", "tipoprod_imagen", "150", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\guirnaldas.jpg",
               "tipo_producto", "tipoprod_imagen", "151", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\pantalla.jpg",
               "tipo_producto", "tipoprod_imagen", "152", "id_tipoprod"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\barras.jpg",
               "tipo_producto", "tipoprod_imagen", "153", "id_tipoprod"));
                                       
                                       
        
        /* INSERTS DE IMAGENES FAMILIA 
                                          System.out.println(bd.insertarImagen("images\\tipo_producto\\iluminacion.jpg",
               "FAMILIA", "IMAGEN_FAMILIA", "107", "ID_FAMILIA"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\construccion.jpg",
               "FAMILIA", "IMAGEN_FAMILIA", "101", "ID_FAMILIA"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\jardin.jpg",
               "FAMILIA", "IMAGEN_FAMILIA", "106", "ID_FAMILIA"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\herramientas.jpg",
               "FAMILIA", "IMAGEN_FAMILIA", "102", "ID_FAMILIA"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\electricidad.jpg",
               "FAMILIA", "IMAGEN_FAMILIA", "103", "ID_FAMILIA"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\pintura.jpg",
               "FAMILIA", "IMAGEN_FAMILIA", "104", "ID_FAMILIA"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\bano.jpg",
               "FAMILIA", "IMAGEN_FAMILIA", "105", "ID_FAMILIA"));
               
        
        /* PRODUCTOS */
        
        /*
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\clavogrande.jpg",
               "producto", "imagen", "101101000000001010000001", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Clavo Corriente 4, bolsa 1kg.jpg",
               "producto", "imagen", "101101000000001010000018", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Clavo corriente 4 bolsa 2,5 kg.jpg",
               "producto", "imagen", "101101000000001010000019", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Clavo corriente 3 bolsa 1kg.jpg",
               "producto", "imagen", "101101000000001010000020", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Clavo para techo 1 3-4 bolsa 100 unidades.jpg",
               "producto", "imagen", "101101000000001010000021", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Clavo para techo 2 1-2 bolsa 100 unidades.jpg",
               "producto", "imagen", "101101000000001010000022", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Clavo Volcanita 1 5-8 bolsa 2,5 kg.jpg",
               "producto", "imagen", "101101000000001010000023", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Grapa galvanizada 1 1-2 1 kg.jpg",
               "producto", "imagen", "101101000000001010000024", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Clavo Volcanita 1 5-8 bolsa 2,5 kg.jpg",
               "producto", "imagen", "101101000000001010000025", "id_producto"));
                                       //TUERCAS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Terminal 20 mm PVC con tuercas.jpg",
               "producto", "imagen", "101101000000001020000026", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tuerca cocina cuadrada 5-32 5 unidades.jpg",
               "producto", "imagen", "101101000000001020000027", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tuerca hexagonal 1-4 100 unidades.jpg",
               "producto", "imagen", "101101000000001020000028", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tuerca hexagonal 1-4 100 unidades.jpg",
               "producto", "imagen", "101101000000001020000029", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tuerca Hexagonal G2 5-16 Pavonada 2 unidades.jpg",
               "producto", "imagen", "101101000000001020000030", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tuerca Mariposa 1-4 Zincada brillante 2 unidades.jpg",
               "producto", "imagen", "101101000000001020000031", "id_producto"));
                                       //TORNILLOS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Autoperforante cab lenteja pfz 8x3-4 100 unidades.jpg",
               "producto", "imagen", "101101000000001030000032", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Autoperforante cabeza lenteja 8X1 1-4 100 unidades.jpg",
               "producto", "imagen", "101101000000001030000033", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Autoperforante cabeza lenteja 8x1 100 unidades.jpg",
               "producto", "imagen", "101101000000001030000034", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Autoperforante hexagonal 12x1 100 unidades.jpg",
               "producto", "imagen", "101101000000001030000035", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tornillo Volcanita CRS ZRB 6 x 1 250 unidades.jpg",
               "producto", "imagen", "101101000000001030000036", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tornillo yeso cartón rosca gruesa 6 x 1 1-4 1000 unidades.jpg",
               "producto", "imagen", "101101000000001030000037", "id_producto"));
                                       //CABLES
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Alambre de cobre aislado (H07V-U) 1,5 mm2 25 m.jpg",
               "producto", "imagen", "101101000000001040000038", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Alambre de cobre aislado (H07V-U) 1,5 mm2 50 m rojo.jpg",
               "producto", "imagen", "101101000000001040000039", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Alambre de cobre aislado (H07V-U) 1,5 mm2 50 m.jpg",
               "producto", "imagen", "101101000000001040000040", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Alambre de cobre aislado (H07V-U) 2,5 mm2 100 m.jpg",
               "producto", "imagen", "101101000000001040000041", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Cordón 2x0,75 mm 10 m  Blanco.jpg",
               "producto", "imagen", "101101000000001040000042", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Cordón 3x1,50 mm 10 m  Negro.jpg",
               "producto", "imagen", "101101000000001040000043", "id_producto"));
                                       //CEMENTO
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Cemento Melón especial 25 Kg.jpg",
               "producto", "imagen", "101101000000001080000044", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Cemento Polpaico 25 kilos.jpg",
               "producto", "imagen", "101101000000001080000045", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Topex hormigón 25 kg.jpg",
               "producto", "imagen", "101101000000001080000046", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Topex interior 25 kg.jpg",
               "producto", "imagen", "101101000000001080000047", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Topex pega 25 kg.jpg",
               "producto", "imagen", "101101000000001080000048", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Topex piso 25 kg.jpg",
               "producto", "imagen", "101101000000001080000049", "id_producto"));
                                       //TABIQUERIA
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\5cm x 20m Cinta de fibra de vidrio autoadhesiva.jpg",
               "producto", "imagen", "101101000000001090000049", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Cinta para juntas 50 mm.jpg",
               "producto", "imagen", "101101000000001090000050", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\5cm x 45m Cinta fibra vidrio, autoadhesiva para junturas de tabiquería.jpg",
               "producto", "imagen", "101101000000001090000051", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\500cc Pasta adhesiva para cinta de fibra de vidrio.jpg",
               "producto", "imagen", "101101000000001090000052", "id_producto"));
                                       //ALAMBRES
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\#14-1 kg Alambre negro recocido.jpg",
               "producto", "imagen", "101101000000001100000053", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\#16 x 500 m Alambre Púas Motto estándar.jpg",
               "producto", "imagen", "101101000000001100000054", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Electrodo 1-8 3.2 mm  1 kg m&h.jpg",
               "producto", "imagen", "101101000000001100000055", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Electrodo 1-8 3.2 mm  1 kg.jpg",
               "producto", "imagen", "101101000000001100000056", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Electrodo 3-32 2.4 mm  1 kg.jpg",
               "producto", "imagen", "101101000000001100000057", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Electrodo 3-32.jpg",
               "producto", "imagen", "101101000000001100000058", "id_producto"));
                                       //AISLANTES
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\2x1m 50 mm plancha.jpg",
               "producto", "imagen", "101101000000001110000059", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\40 m2 10-40 Fieltro Asfáltico Corrugado Dynaflex.jpg",
               "producto", "imagen", "101101000000001110000060", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Aisla poliester 50mmx0.40x10mt.jpg",
               "producto", "imagen", "101101000000001110000061", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Sachet polietileno trasparente 3X10 mt.jpg",
               "producto", "imagen", "101101000000001110000062", "id_producto"));
                                       //CADENAS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\8,5cm x5m Escalerilla Acma.jpg",
               "producto", "imagen", "101101000000001120000063", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\15x20 cmx4.5m Cadena 1520 Acma.jpg",
               "producto", "imagen", "101101000000001120000064", "id_producto"));
                                       //CUERDAS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Lienza de algodón 2.0mm x 150grs..jpg",
               "producto", "imagen", "101101000000001130000065", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Cuerda de polipropileno trenzado 6 mm x10 m.jpg",
               "producto", "imagen", "101101000000001130000066", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Cuerda polipropileno multifuncional torcido 6mm.jpg",
               "producto", "imagen", "101101000000001130000067", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Algodón trenzado 2,5 mm 15 m.jpg",
               "producto", "imagen", "101101000000001130000068", "id_producto"));
                                       //ACCESORIOS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Carretilla liviana verde 60 litros.jpg",
               "producto", "imagen", "101101000000001140000069", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Balde concretero 14 litros.jpg",
               "producto", "imagen", "101101000000001140000070", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tinaja cilíndrica 65 litros.jpg",
               "producto", "imagen", "101101000000001140000071", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tinaja rectangular 45 litros.jpg",
               "producto", "imagen", "101101000000001140000072", "id_producto"));
                                       //ALICATES
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Caiman 9 punta larga industrial.jpg",
               "producto", "imagen", "101102000000001150000073", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Caiman 10 semi-profesional.jpg",
               "producto", "imagen", "101102000000001150000074", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Caimán curvo 7 acero.jpg",
               "producto", "imagen", "101102000000001150000075", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Alicate multifuncional acero.jpg",
               "producto", "imagen", "101102000000001150000076", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Set de alicates acero 3 unidades.jpg",
               "producto", "imagen", "101102000000001150000077", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Set de alicates acero 3 unidades karson.jpg",
               "producto", "imagen", "101102000000001150000078", "id_producto"));
                                       //DADOS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Dado magnético 10 mm hexagonal.jpg",
               "producto", "imagen", "101102000000001160000079", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Dado 18mm mdo 1-2.jpg",
               "producto", "imagen", "101102000000001160000080", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Dado poligonal 1-2x30 mm acero.jpg",
               "producto", "imagen", "101102000000001160000081", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Juego de llaves allen.jpg",
               "producto", "imagen", "101102000000001160000082", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Juego de llaves combinadas 14 piezas 3-8 a 1-1-4.jpg",
               "producto", "imagen", "101102000000001160000083", "id_producto"));
//DESATORNILLADORES
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Atornillador inalámbrico 4.8 V + 51 accesorios.jpg",
               "producto", "imagen", "101102000000001170000084", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Atornillador Punta Paleta 3 x 75mm.jpg",
               "producto", "imagen", "101102000000001170000085", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Destornillador Phillips #1x6 acero.jpg",
               "producto", "imagen", "101102000000001170000086", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Set 2 Atornilladores Mini Imantados.jpg",
               "producto", "imagen", "101102000000001170000087", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Set de destornilladores acero 6 unidades.jpg",
               "producto", "imagen", "101102000000001170000088", "id_producto"));
//SERRUCHOS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Serrucho carpintero 450 mm acero.jpg",
               "producto", "imagen", "101102000000001180000089", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Serrucho carpintero 500 mm acero.jpg",
               "producto", "imagen", "101102000000001180000090", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Serrucho poda manual 12.jpg",
               "producto", "imagen", "101102000000001180000091", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Sierra para jardín de acero café.jpg",
               "producto", "imagen", "101102000000001180000092", "id_producto"));
                                       //MARTILLOS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Martillo carpintero 24 Oz acero.jpg",
               "producto", "imagen", "101102000000001190000093", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Combo mango fibra vidrio y acero al carbono 1 kg.jpg",
               "producto", "imagen", "101102000000001190000094", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Martillo carpintero, 25 Oz.jpg",
               "producto", "imagen", "101102000000001190000095", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Mazo de goma 8 oz blanco.jpg",
               "producto", "imagen", "101102000000001190000096", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Maceta golpe suave de 40 Oz.jpg",
               "producto", "imagen", "101102000000001190000097", "id_producto"));
                                       //PRENSAS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Prensa rápida 4.jpg",
               "producto", "imagen", "101102000000001200000098", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Pinza 4 acero inoxidable.jpg",
               "producto", "imagen", "101102000000001200000099", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Prensa F 120x1000.jpg",
               "producto", "imagen", "101102000000001200000100", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Prensa esquina 4 pesada.jpg",
               "producto", "imagen", "101102000000001200000101", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Prensa tornillo mecánico de mesa.jpg",
               "producto", "imagen", "101102000000001200000102", "id_producto"));
                                       //SETHERRAMIENTAS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Herramienta multipropósito con accesorios.jpg",
               "producto", "imagen", "101102000000001210000103", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Broca mix 16 piezas mm (fierro,madera,concreto).jpg",
               "producto", "imagen", "101102000000001210000104", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Set 26 piezas para atornillar.jpg",
               "producto", "imagen", "101102000000001210000105", "id_producto"));
                                       //CANALIZACION 
					System.out.println(bd.insertarImagen("images\\tipo_producto\\Derivación T para canaleta 100x50 mm.jpg",
               "producto", "imagen", "101103000000001220000106", "id_producto")); /*
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Unión para canaleta 100x45 mm.jpg",
               "producto", "imagen", "101103000000001220000107", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Canaleta 100x50 mm 2 m.jpg",
               "producto", "imagen", "101103000000001220000108", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Ángulo interno para canaleta 100x45 mm.jpg",
               "producto", "imagen", "101103000000001220000109", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Ángulo plano para canaleta 100x45 mm.jpg",
               "producto", "imagen", "101103000000001220000110", "id_producto"));
                                       //ALARGADORES
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Alargador 6 tomas con interruptor On Off 3 m.jpg",
               "producto", "imagen", "101103000000001230000111", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Alargador 6 tomas con interruptor On Off 3 m Gris.jpg",
               "producto", "imagen", "101103000000001230000112", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Alargador 6 tomas con 2 puertos USB.jpg",
               "producto", "imagen", "101103000000001230000113", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Carrete alargador 4 tomas 20 m Amarillo.jpg",
               "producto", "imagen", "101103000000001230000114", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Alargador 6 tomas con interruptor On Off 5 m Gris.jpg",
               "producto", "imagen", "101103000000001230000115", "id_producto"));
                                       //TEMPORIZADORES
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Set de 2 timers analógicos 2300 W manual mecánico.jpg",
               "producto", "imagen", "101103000000001240000116", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Timer analógico enchufable 2000 W manual mecánico.jpg",
               "producto", "imagen", "101103000000001240000117", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Timer digital enchufable 2000 W manual y automático.jpg",
               "producto", "imagen", "101103000000001240000118", "id_producto"));
        
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Timer analógico enchufable 2000 W manual mecánico2.jpg",
               "producto", "imagen", "101103000000001240000119", "id_producto"));
                                       //PROTECCIONELECT
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Guante de albañil goma.jpg",
               "producto", "imagen", "101103000000001250000120", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Guante profesional nitrilo.jpg",
               "producto", "imagen", "101103000000001250000121", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Lente de seguridad Spy Claro.jpg",
               "producto", "imagen", "101103000000001250000122", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Lente de seguridad Spy Pro gris.jpg",
               "producto", "imagen", "101103000000001250000123", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Buzo desechable blanco.jpg",
               "producto", "imagen", "101103000000001250000124", "id_producto"));
//CAJASDIS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tapa ciega 102x64 mm PVC.jpg",
               "producto", "imagen", "101103000000001260000124", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Caja de distribución embutida 94x68,5 mm PVC.jpg",
               "producto", "imagen", "101103000000001260000125", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Caja de distribución embutida 99x58,5 mm PVC.jpg",
               "producto", "imagen", "101103000000001260000126", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Caja de distribución embutida 16x20x25 mm PVC.jpg",
               "producto", "imagen", "101103000000001260000127", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Caja de distribución embutida 106x71 mm PVC.jpg",
               "producto", "imagen", "101103000000001260000128", "id_producto"));
                                       //ENCHUFES
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tomacorriente triple 10 A Gris.jpg",
               "producto", "imagen", "101103000000001270000128", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tomacorriente triple 10 A Blanco.jpg",
               "producto", "imagen", "101103000000001270000129", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tomacorriente doble 10 A Beige.jpg",
               "producto", "imagen", "101103000000001270000130", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tomacorriente triple 10 A BlancoB.jpg",
               "producto", "imagen", "101103000000001270000131", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tomacorriente doble 10 A + 1 USB 750mA Blanco.jpg",
               "producto", "imagen", "101103000000001270000132", "id_producto"));
                                       //PASACABLES
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Pasacables 60 mm.jpg",
               "producto", "imagen", "101103000000001280000133", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Pasacables 60 mmC.jpg",
               "producto", "imagen", "101103000000001280000134", "id_producto"));
//PINTEINT
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Pintura látex acrílico mate 4 gl Blanco.jpg",
               "producto", "imagen", "101104000000001290000135", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Látex súper cubriente blanco 4 gl.jpg",
               "producto", "imagen", "101104000000001290000136", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Esmalte al agua satinado 1 gl Damasco.jpg",
               "producto", "imagen", "101104000000001290000137", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Látex Profesional 1-4 galón Marfil Oriental.jpg",
               "producto", "imagen", "101104000000001290000138", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Barniz vitrificante semibrillante 1 gl.jpg",
               "producto", "imagen", "101104000000001290000139", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Barniz vitrificante brillante 1 gl.jpg",
               "producto", "imagen", "101104000000001290000140", "id_producto"));
                                       //PINTIEXT
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Barniz poliuretano a base de agua exterior.jpg",
               "producto", "imagen", "101104000000001300000141", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Esmalte al agua antibacterial semibrillo blanco.jpg",
               "producto", "imagen", "101104000000001300000142", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Pieza y fachada premium blanco.jpg",
               "producto", "imagen", "101104000000001300000143", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Barniz poliuretano a base de agua exterior 2.jpg",
               "producto", "imagen", "101104000000001300000144", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Barniz poliuretano a base de agua exterior satinado.jpg",
               "producto", "imagen", "101104000000001300000145", "id_producto")); 
                                       //PINTSPRAY
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Pintura spray general 400 ml marrón.jpg",
               "producto", "imagen", "101104000000001310000146", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Pintura anticorrosiva en spray brillante.jpg",
               "producto", "imagen", "101104000000001310000147", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Pintura en spray brillante 340 gr Rosado intenso.jpg",
               "producto", "imagen", "101104000000001310000148", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Pintura spray metálico 400 ml azul.jpg",
               "producto", "imagen", "101104000000001310000149", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Pintura spray metálico 400 ml bronce.jpg",
               "producto", "imagen", "101104000000001310000150", "id_producto"));
                                       //DILUYENTES
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Aguarrás mineral 1 l.jpg",
               "producto", "imagen", "101104000000001320000151", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Alcohol isopropilico 1 litro.jpg",
               "producto", "imagen", "101104000000001320000152", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Desoxidante 1 l.jpg",
               "producto", "imagen", "101104000000001320000153", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Diluyente duco invierno 1 l.jpg",
               "producto", "imagen", "101104000000001320000154", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Ácido muriático 5 l.jpg",
               "producto", "imagen", "101104000000001320000155", "id_producto"));
                                       //HERRPINTOR
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Set de brochas 1-2-3 3 unidades.jpg",
               "producto", "imagen", "101104000000001330000156", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Brocha multipropósito 2.jpg",
               "producto", "imagen", "101104000000001330000157", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Rodillo de poliéster 18 cm.jpg",
               "producto", "imagen", "101104000000001330000158", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Rodillo de fibra termofusionado 2x18 cm.jpg",
               "producto", "imagen", "101104000000001330000159", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Cinta para enmascarar 18 mm 40 m.jpg",
               "producto", "imagen", "101104000000001330000160", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Cinta para enmascarar 48 mm 40 m.jpg",
               "producto", "imagen", "101104000000001330000161", "id_producto"));
                                       //BARNICES
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Barniz marino brillante 1 gl Natural.jpg",
               "producto", "imagen", "101104000000001340000162", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Barniz marino brillante 1-4 gl Natural.jpg",
               "producto", "imagen", "101104000000001340000163", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Barniz impermeabilizante semibrillante 1 gl.jpg",
               "producto", "imagen", "101104000000001340000164", "id_producto"));
                                       //TEXTURAS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Palmeta piedra para muro 20x10 cm 0,25 m2 beige.jpg",
               "producto", "imagen", "101104000000001350000165", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Palmeta piedra para muro 20x10 cm 0,25 m2 gris.jpg",
               "producto", "imagen", "101104000000001350000166", "id_producto"));
//TUBERIAS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tubería hidráulica para cementar 20 mm 6 m.jpg",
               "producto", "imagen", "101105000000001060000167", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tubería hidráulica para cementar 25 mm 6 m.jpg",
               "producto", "imagen", "101105000000001060000168", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Abrazadera PVC para tubería 50x20 mm.jpg",
               "producto", "imagen", "101105000000001060000169", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tubería 1-2 3 m acero.jpg",
               "producto", "imagen", "101105000000001060000170", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tubería hidráulica para cementar 20 mm 3 m.jpg",
               "producto", "imagen", "101105000000001060000171", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tubería fusión PPR 25 mmx3 m.jpg",
               "producto", "imagen", "101105000000001060000172", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tubería hidráulica a presión 2x100 cm.jpg",
               "producto", "imagen", "101105000000001060000173", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tubería hidráulica para cementar 40 mm 6 m.jpg",
               "producto", "imagen", "101105000000001060000174", "id_producto"));
                                       //EXTRACTORES
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Extractor de aire mural 110 W.jpg",
               "producto", "imagen", "101105000000001360000175", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Extractor de aire 6 cuadrado 320m3 con persiana.jpg",
               "producto", "imagen", "101105000000001360000176", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Extractor de aire mural 110 W 2.jpg",
               "producto", "imagen", "101105000000001360000177", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Extractor de aire mural 264 W.jpg",
               "producto", "imagen", "101105000000001360000178", "id_producto"));
//PERCHEROS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Gancho doble 5x65x55 cm acero cromado.jpg",
               "producto", "imagen", "101105000000001370000179", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Gancho para toallas Cromado.jpg",
               "producto", "imagen", "101105000000001370000180", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Gancho simple cromado.jpg",
               "producto", "imagen", "101105000000001370000181", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Percha doble cromado.jpg",
               "producto", "imagen", "101105000000001370000182", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Gancho tripe para toallas Blanco.jpg",
               "producto", "imagen", "101105000000001370000183", "id_producto"));
                                       //FLEXIBLES
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Flexible agua 1-2 HI-HI 40 cm.jpg",
               "producto", "imagen", "101105000000001380000184", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Flexible agua 1-2 HI-HI 20 cm.jpg",
               "producto", "imagen", "101105000000001380000185", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Flexible agua 1-2 HI-HE 25 cm.jpg",
               "producto", "imagen", "101105000000001380000186", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Flexible agua 1-2 HI-HE 40 cm.jpg",
               "producto", "imagen", "101105000000001380000187", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Flexible agua 1-2 HI-HI 50 cm.jpg",
               "producto", "imagen", "101105000000001380000188", "id_producto"));
                                       //VALVULAS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Filtro de agua para llave.jpg",
               "producto", "imagen", "101105000000001390000189", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Llave led para osmosis inversa acero.jpg",
               "producto", "imagen", "101105000000001390000190", "id_producto"));
                                       //DESTAPES NO HAY
                                       
                                       //GRIFERIA
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Monomando ducha Línea Galia Plus.jpg",
               "producto", "imagen", "101105000000001410000191", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Difusor para ducha metal.jpg",
               "producto", "imagen", "101105000000001410000192", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Monomando ducha Perugia.jpg",
               "producto", "imagen", "101105000000001410000193", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Desague cuadrado 14,6x14,6 cm acero.jpg",
               "producto", "imagen", "101105000000001410000194", "id_producto"));
                                       //CTRLPLAGAS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Insecticida para todo tipo de insectos 100 ml.jpg",
               "producto", "imagen", "101106000000001070000195", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Raticida en pellet 50 gr.jpg",
               "producto", "imagen", "101106000000001070000196", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Raticida en pellet 50 gr 2.jpg",
               "producto", "imagen", "101106000000001070000197", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Insecticida para moscas y zancudos 440 ml aerosol.jpg",
               "producto", "imagen", "101106000000001070000198", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Insecticida para casa y jardín 440 ml aerosol.jpg",
               "producto", "imagen", "101106000000001070000199", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Insecticida para casa y jardín 440 ml aerosol.jpg",
               "producto", "imagen", "101106000000001070000200", "id_producto"));
                                       //FERTILIZANTES
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Fertilizante para césped 5 kg bolsa.jpg",
               "producto", "imagen", "101106000000001420000202", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Mejorador de suelo arena sanitizada 5 kg bolsa.jpg",
               "producto", "imagen", "101106000000001420000203", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Fertilizante para plantas y árboles 1 kg bolsa.jpg",
               "producto", "imagen", "101106000000001420000204", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Fertilizante para césped otoño-invierno 1 kg bolsa.jpg",
               "producto", "imagen", "101106000000001420000205", "id_producto"));
                                       //MACETEROS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Macetero de plástico 50x37x50 cm negro.jpg",
               "producto", "imagen", "101106000000001430000206", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Macetero de plástico 17 cm.jpg",
               "producto", "imagen", "101106000000001430000207", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Macetero redondo de arcilla 43x48 cm terracota.jpg",
               "producto", "imagen", "101106000000001430000208", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Macetero de cerámica 12x12x10 cm gris.jpg",
               "producto", "imagen", "101106000000001430000209", "id_producto"));
                                       //CERCOS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Reja plegable de metal 45x245 cm Verde.jpg",
               "producto", "imagen", "101106000000001440000210", "id_producto"));
                                       //MANGUERAS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Set de manguera extensible 15 m.jpg",
               "producto", "imagen", "101106000000001450000211", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Manguera 30 m verde.jpg",
               "producto", "imagen", "101106000000001450000212", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Manguera de piscina 15 m azul.jpg",
               "producto", "imagen", "101106000000001450000213", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Manguera 10 m verde.jpg",
               "producto", "imagen", "101106000000001450000214", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Set de manguera 20 m Verde.jpg",
               "producto", "imagen", "101106000000001450000215", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Set de manguera 15 m Verde.jpg",
               "producto", "imagen", "101106000000001450000216", "id_producto"));
//TIJERAS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tijeron poda hojas forjadas.jpg",
               "producto", "imagen", "101106000000001460000217", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tijerón cortacésped de metal Negro.jpg",
               "producto", "imagen", "101106000000001460000218", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tijerón de poda aluminio telescópico 60 cm a 90 cm.jpg",
               "producto", "imagen", "101106000000001460000219", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tijera para jardín de metal Celeste.jpg",
               "producto", "imagen", "101106000000001460000220", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tijera anvil para jardín 20 cm de metal Negro.jpg",
               "producto", "imagen", "101106000000001460000221", "id_producto"));
                                       
                                       
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tijera resina y acero inoxidable verde musgo.jpg",
               "producto", "imagen", "101106000000001460000222", "id_producto"));
                                       //RASTRILLOS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Rastrillo 14 puntas mango fibra.jpg",
               "producto", "imagen", "101106000000001470000223", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Rastrillo 14 dientes de metal negro.jpg",
               "producto", "imagen", "101106000000001470000224", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Rastrillo acero.jpg",
               "producto", "imagen", "101106000000001470000225", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Rastrillo básico 12 dientes de acero Negro.jpg",
               "producto", "imagen", "101106000000001470000226", "id_producto"));
//AMPOLLETAS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Ampolleta LED E-27 35 W Cálida.jpg",
               "producto", "imagen", "101107000000001480000227", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Ampolleta LED E-27 40 W Fría.jpg",
               "producto", "imagen", "101107000000001480000228", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Ampolleta LED E-27 35 W Fría.jpg",
               "producto", "imagen", "101107000000001480000229", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Ampolleta halógena G-9 25 W Cálida.jpg",
               "producto", "imagen", "101107000000001480000230", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Ampolleta LED GU-10 30 W Fría.jpg",
               "producto", "imagen", "101107000000001480000231", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Pack 2 ampolletas 15 watts luz fría espiral.jpg",
               "producto", "imagen", "101107000000001480000232", "id_producto"));
                                       //FOCOS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Panel Led sobrepuesto cuadrado 6 W frío.jpg",
               "producto", "imagen", "101107000000001490000233", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Proyector led 10W 6000 K.jpg",
               "producto", "imagen", "101107000000001490000234", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Foco proyector de área Led SMD SEC 10 W frío.jpg",
               "producto", "imagen", "101107000000001490000235", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Reflector 10 W Negro.jpg",
               "producto", "imagen", "101107000000001490000236", "id_producto"));
                                       //TUBOS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Partidor universal para tubo fluorecente.jpg",
               "producto", "imagen", "101107000000001500000237", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tubo fluorescente G-13 36 W Fría.jpg",
               "producto", "imagen", "101107000000001500000238", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tubo fluorescente G-13 18 W Fría.jpg",
               "producto", "imagen", "101107000000001500000239", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Equipo fluorescente 18 W con 2 tubos.jpg",
               "producto", "imagen", "101107000000001500000240", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tubo fluorescente G-10Q 22 W Fría.jpg",
               "producto", "imagen", "101107000000001500000241", "id_producto"));
                                       
                                       
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Tubo LED G-5 120 W Cálida.jpg",
               "producto", "imagen", "101107000000001500000242", "id_producto"));
//GUIRNALDAS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Guirnalda eléctrica bolas blanco y negro.jpg",
               "producto", "imagen", "101107000000001510000243", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Guirnalda LED 40 luces.jpg",
               "producto", "imagen", "101107000000001510000244", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Guirnalda hiedra artificial 206x6x6 cm.jpg",
               "producto", "imagen", "101107000000001510000245", "id_producto")); /*
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Guirnalda solar ampolletas 20 luces led.jpg",
               "producto", "imagen", "101107000000001510000246", "id_producto"));
                                       //PANTALLAS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Pantalla de papel 48 cm.jpg",
               "producto", "imagen", "101107000000001520000247", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Pantalla blanca 15 cm.jpg",
               "producto", "imagen", "101107000000001520000248", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Pantalla Trípode.jpg",
               "producto", "imagen", "101107000000001520000249", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Pantalla negra 12,5 cm.jpg",
               "producto", "imagen", "101107000000001520000250", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Pantalla papel rosa 30 cm.jpg",
               "producto", "imagen", "101107000000001520000251", "id_producto"));
                                       //BARRAS
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Barra 33 W.jpg",
               "producto", "imagen", "101107000000001530000253", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Foco sobrepuesto 16 cm 3 luces 60 W.jpg",
               "producto", "imagen", "101107000000001530000254", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Foco 60 W.jpg",
               "producto", "imagen", "101107000000001530000255", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Foco 3 luces 40 W.jpg",
               "producto", "imagen", "101107000000001530000256", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Barra 3 luces 50 W.jpg",
               "producto", "imagen", "101107000000001530000257", "id_producto"));
                                       System.out.println(bd.insertarImagen("images\\tipo_producto\\Barra 2 luces 50 W.jpg",
               "producto", "imagen", "101107000000001530000258", "id_producto"));

*/


                                       
        
       
       
    }
    
}
