/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import bean.Player;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author diask
 */
public class PlayerDAO {
    DBManager dbm = new DBManager();
    public void createPlayer(Player player){
        String sql = "INSERT INTO players (name, address, team, role)"+
                "VALUES ('"+player.getName()+"',"
                + " '"+player.getAddress()+"',"
                + " '"+player.getTeam()+"',"
                + " '"+player.getRole()+");";
        
        dbm.executeUpdate(sql);
    }
    public ArrayList<Player> retrieveAllPlayers(){
        ArrayList<Player> players = new ArrayList<Player>();
        
        ResultSet rs = null;
        
        try{
            String sql = "SELECT * from players";
            rs =dbm.executeQuery(sql);
            if(rs != null){
            while(rs.next()){
                Player player = new Player();
                player.setName(rs.getString("name"));
                player.setAddress(rs.getString("address"));
                player.setTeam(rs.getString("team"));
                player.setRole(rs.getString("role"));
                players.add(player);
            }
            }
        }catch(Exception e){
                System.out.println("Error retrieving player "+e);
        }
                
        return players;
    }
    public void deletePlayer(int ID){
        String sql = "DELETE FROM players WHERE name="+ID+";";
        dbm.executeUpdate(sql);        
    }
    public Player retrievePlayer(int ID){
        Player player = null;
        try{
            String sql = "SELECT * FROM players where Id="+ID+";";
            ResultSet rs = dbm.executeQuery(sql);
            if(rs.next()){
                player = new Player();
                player.setName(rs.getString("name"));
                player.setAddress(rs.getString("address"));
                player.setTeam(rs.getString("team"));
                player.setRole(rs.getString("role"));
            }
        }catch(Exception e){
                System.out.println("Error retrieving player "+e);            
        }
        return player;
    }
    public void updatePlayer(Player player){
        String sql ="UPDATE players "
                + "SET name='"+player.getName()+"';";
        dbm.executeUpdate(sql);
    }
}
