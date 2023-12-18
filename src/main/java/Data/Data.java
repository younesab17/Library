package Data;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class Data
 */
public class Data extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String url = "jdbc:mysql://localhost:3306/biblio";
    private static final String username = "root";
    private static final String password= "";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Data() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String searchType = request.getParameter("searchType");
    	String searchTerm = request.getParameter("searchTerm");
    	searchTerm=searchTerm.trim();
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Connection connexion = null;
        try {
            connexion = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        List<List<String>> livres = new ArrayList<>();
    	
    	try {
        	PreparedStatement selection = connexion.prepareStatement("SELECT * FROM livre ");
            ResultSet resultat = selection.executeQuery();
           
            
            
            while (resultat.next()) {
            	List<String> livreData = new ArrayList<>();
            	livreData.add( resultat.getString("titre"));
            	livreData.add( resultat.getString("auteur"));   
            	  
            	livreData.add( resultat.getString("genre"));
            	  
            	livres.add(livreData);
            	
            }
    	}catch (SQLException e) {
	            throw new ServletException(e);
	        }
    	
    	List<List<String>> livresFilter =new ArrayList<>();
    	
    	if (searchType != null && !searchType.equals("None") && searchTerm != null){
   		 if(searchType.equals("titre")){
   			 for(List<String> livre : livres){
   				 if(searchTerm.equals(livre.get(0)))
   					 livresFilter.add(livre);	 
   			 }
   		 }
   		 if(searchType.equals("auteur")){
   			 for(List<String> livre : livres){
   				 if(searchTerm.equals(livre.get(1)))
   					 livresFilter.add(livre);	 
   			 }
   		 }
   		 if(searchType.equals("genre")){
   			 for(List<String> livre : livres){
   				 if(searchTerm.equals(livre.get(2)))
   					 livresFilter.add(livre);	 
   			 }
   		 }
   	 }
	 
	
	else{
		 livresFilter=livres;
	 }
    	request.setAttribute("livres", livresFilter);
        request.getRequestDispatcher("Livres.jsp").forward(request, response);
    	
    	 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    
	    try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Connection connexion = null;
        try {
            connexion = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        String action = request.getParameter("action");
		if ("Clients".equals(action)) {
			
	      
			try {
	        	PreparedStatement selection2 = connexion.prepareStatement("SELECT * FROM user where role ='client' ");
	            ResultSet resultat = selection2.executeQuery();
	            List<List<String>> clients = new ArrayList<>();
	            
	            while (resultat.next()) {
	            	List<String> clientData = new ArrayList<>();
	            	clientData.add( resultat.getString("username"));
	            	clientData.add( resultat.getString("CIN"));   
	            	  
	            	clientData.add( resultat.getString("Adresse"));
	            	  
	            	clients.add(clientData);
	            	
	            }
	            
	            request.setAttribute("clients", clients);
	            request.getRequestDispatcher("clients.jsp").forward(request, response);
	        }catch (SQLException e) {
	            throw new ServletException(e);
	        }
	        response.sendRedirect("clients.jsp");
	        
	        
	    } else if ("Livres".equals(action)) {
	    	
	    	try {
	        	PreparedStatement selection2 = connexion.prepareStatement("SELECT * FROM livre ");
	            ResultSet resultat = selection2.executeQuery();
	            List<List<String>> livres = new ArrayList<>();
	            
	            while (resultat.next()) {
	            	List<String> livreData = new ArrayList<>();
	            	livreData.add( resultat.getString("titre"));
	            	livreData.add( resultat.getString("auteur"));   
	            	  
	            	livreData.add( resultat.getString("genre"));
	            	  
	            	livres.add(livreData);
	            	
	            }
	            
	            request.setAttribute("livres", livres);
	            request.getRequestDispatcher("Livres.jsp").forward(request, response);
	        }catch (SQLException e) {
	            throw new ServletException(e);
	        }
	        
	        response.sendRedirect("Livres.jsp");
	        
	        
	    } else if ("Emprunts".equals(action)) {
	    	try {
	        	PreparedStatement selection3 = connexion.prepareStatement("SELECT * FROM emprunt ");
	            ResultSet resultat = selection3.executeQuery();
	            List<List<String>> emprunts = new ArrayList<>();
	            
	            while (resultat.next()) {
	            	List<String> empruntData = new ArrayList<>();
	            	empruntData.add( resultat.getString("titre"));
	            	empruntData.add( resultat.getString("username"));   
	            	empruntData.add( resultat.getString("date_emprunt"));
	            	empruntData.add( resultat.getString("date_retour"));
	       
	            	emprunts.add(empruntData);
	            	
	            }
	            
	            request.setAttribute("emprunts", emprunts);
	            request.getRequestDispatcher("emprunts.jsp").forward(request, response);
	            
	        }catch (SQLException e) {
	            throw new ServletException(e);
	        }
	        response.sendRedirect("emprunts.jsp");
	    } 
	    else if ("Demandes".equals(action)) {
	    	try {
	        	PreparedStatement selection3 = connexion.prepareStatement("SELECT * FROM requests ");
	            ResultSet resultat = selection3.executeQuery();
	            List<List<String>> requests = new ArrayList<>();
	            
	            while (resultat.next()) {
	            	List<String> empruntData = new ArrayList<>();
	            	
	            	empruntData.add( resultat.getString("titre"));
	            	empruntData.add( resultat.getString("username"));   
	            	empruntData.add( resultat.getString("date_emprunt"));
	            	empruntData.add( resultat.getString("date_retour"));
	       
	            	requests.add(empruntData);
	            	
	            }
	            
	            request.setAttribute("requests", requests);
	            request.getRequestDispatcher("Requests.jsp").forward(request, response);
	            
	        }catch (SQLException e) {
	            throw new ServletException(e);
	        }
	        response.sendRedirect("Requests.jsp");
	    }else if ("Dashboard".equals(action)) {
	        response.sendRedirect("Admin_profile.jsp");
	    }
		
	
	}

}