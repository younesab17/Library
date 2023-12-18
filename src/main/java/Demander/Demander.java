package Demander;

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
 * Servlet implementation class Demander
 */
public class Demander extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String url = "jdbc:mysql://localhost:3306/biblio";
    private static final String username = "root";
    private static final String password= "";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Demander() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	    String livre = request.getParameter("titre");
	    HttpSession session = request.getSession(false);
	    String user=session.getAttribute("username").toString();
	    try {
        	PreparedStatement selection2 = connexion.prepareStatement("DELETE FROM requests WHERE username=? AND titre=?");
        	selection2.setString(1, user);
        	selection2.setString(2, livre);
            int ok = selection2.executeUpdate();
           
         
        }catch (SQLException e) {
            throw new ServletException(e);
        }
        
        response.sendRedirect("client_profile.jsp");
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
	    String livre = request.getParameter("titre");
	    HttpSession session = request.getSession(false);
	    String user=session.getAttribute("username").toString();
	    try {
        	PreparedStatement selection2 = connexion.prepareStatement("INSERT INTO requests (date_emprunt,date_retour,username,titre) VALUES (NOW(),DATE_ADD(NOW(),INTERVAL 14 DAY),?,?)");
        	selection2.setString(1, user);
        	selection2.setString(2, livre);
            int ok = selection2.executeUpdate();
           
         
        }catch (SQLException e) {
            throw new ServletException(e);
        }
        
        response.sendRedirect("client_profile.jsp");

        
	}

}
