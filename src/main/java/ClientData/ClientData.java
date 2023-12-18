package ClientData;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class ClientData
 */
public class ClientData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String url = "jdbc:mysql://localhost:3306/biblio";
    private static final String username = "root";
    private static final String password= "";
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
	    HttpSession session = request.getSession(false);
	    String user=session.getAttribute("username").toString();
        	if ("Livres".equals(action)) {
	    	
	    	try {
	        	PreparedStatement selection2 = connexion.prepareStatement("SELECT * FROM livre where exemplaires>0 AND titre NOT IN (SELECT titre FROM requests where username=? )AND titre NOT IN (SELECT titre FROM emprunt where username=? )");
	        	selection2.setString(1, user);
	        	selection2.setString(2, user);
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
	            request.getRequestDispatcher("list_livres.jsp").forward(request, response);
	        }catch (SQLException e) {
	            throw new ServletException(e);
	        }
	        
	        response.sendRedirect("list_livres.js");
        	}
        	else if ("Demandes".equals(action)) {
    	    	try {
    	        	PreparedStatement selection3 = connexion.prepareStatement("SELECT * FROM requests where username=? ");
    	        	selection3.setString(1, user);
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
    	            request.getRequestDispatcher("Demandes.jsp").forward(request, response);
    	            
    	        }catch (SQLException e) {
    	            throw new ServletException(e);
    	        }
    	        response.sendRedirect("Demandes.jsp");
        	}else if ("Historique".equals(action)) {
    	    	try {
    	        	PreparedStatement selection3 = connexion.prepareStatement("SELECT * FROM emprunt where username= ? ");
    	        	selection3.setString(1, user);

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
    	            request.getRequestDispatcher("Historique.jsp").forward(request, response);
    	            
    	        }catch (SQLException e) {
    	            throw new ServletException(e);
    	        }
    	        response.sendRedirect("Historique.jsp");
    	    } 
        	else if ("Dashboard".equals(action)) {
    	        response.sendRedirect("client_profile.jsp");
    	    }

	}
}
