package test;

import dao.StudioDAO;
import entities.Studio;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Едик  Лисогуб on 07.03.2016.
 */
public class StudioDAOtest {
 public static void main(String [] argc){
     StudioDAO sdao=new StudioDAO();
     try {
         List<Studio> arr= sdao.getAll();
         System.out.println(arr.size());
         System.out.println(arr.get(0).getName());
         sdao.getByName(arr.get(0).getName()).setName("Universal update");//dont work because update is not comlete
         System.out.println(sdao.getById(arr.get(0).getId()).getName());
     } catch (SQLException e) {
         e.printStackTrace();
     }
 }
}
