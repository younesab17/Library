package delete;

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
 * Servlet implementation class delete
 */
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String url = "jdbc:mysql://localhost:3306/biblio";
    private static final String username = "root";
    private static final String password= "";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete() {
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
		String action=request.getParameter("action");
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
        if("Supprimer".equals(action)) {
        	try {
        		String user= request.getParameter("username");
            	PreparedStatement delete = connexion.prepareStatement("DELETE FROM user where username =? ");
            	delete.setString(1, user);
            	int ok = delete.executeUpdate();
                request.getRequestDispatcher("Admin_profile.jsp").forward(request, response);
            }catch (SQLException e) {
                throw new ServletException(e);
            }
        }
        if("Retirer".equals(action)) {
        	try {
        		String titre= request.getParameter("titre");
            	PreparedStatement delete = connexion.prepareStatement("DELETE FROM livre where titre =? ");
            	delete.setString(1, titre);
            	int ok = delete.executeUpdate();
                request.getRequestDispatcher("Admin_profile.jsp").forward(request, response);
            }catch (SQLException e) {
                throw new ServletException(e);
            }
        }
      
        
		
	}

}
