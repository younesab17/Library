package Register;

import jakarta.servlet.ServletException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.jasper.tagplugins.jstl.core.Out;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
  	private static final String url = "jdbc:mysql://localhost:3306/biblio";
    private static final String username = "root";
    private static final String password= "";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		
		String user = request.getParameter("username");
        String mp = request.getParameter("password");
        String cin = request.getParameter("cin");
        String tlf = request.getParameter("tlf");
        String adresse = request.getParameter("adresse");
        String role = "client";
        
        
		  Connection connexion = null;
	        try {
	            connexion = DriverManager.getConnection(url, username, password);
	        } catch (SQLException e) {
	            throw new ServletException(e);
	        }
	        try {
	        	PreparedStatement selection = connexion.prepareStatement("SELECT * FROM user WHERE username= ?");
	        	selection.setString(1, user);
	            ResultSet resultat = selection.executeQuery();
	            int i=0;
	            while (resultat.next()) {
	                
	                i++;
	                
	            }
	            if(i>0) {
	            	
                    request.setAttribute("message", "Ce username est déjà utilisé");
	            	request.getRequestDispatcher("/Sign up.jsp").forward(request, response);
	            }
	            else {
	            	try {
	    	            PreparedStatement requete = connexion.prepareStatement("INSERT INTO user VALUES (?,?,?,?,?,?)");
	    	            requete.setString(1, user);
	    	            requete.setString(2, cin);
	    	            requete.setString(3, tlf);
	    	            requete.setString(4, adresse);
	    	            requete.setString(5, mp);
	    	            requete.setString(6, role);    	           
	    	            requete.executeUpdate();
		            	request.getRequestDispatcher("/Login.jsp").forward(request, response); //!!!

	    	        } catch (SQLException e) {
	    	            throw new ServletException(e);
	    	        }
	            }
	        } catch (SQLException e) {
	            throw new ServletException(e);
	        }
	        try {
	            connexion.close();
	        } catch (SQLException e) {
	            throw new ServletException(e);
	        }

	       


	
   }
}
