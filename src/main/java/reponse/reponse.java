package reponse;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class reponse
 */
public class reponse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String url = "jdbc:mysql://localhost:3306/biblio";
    private static final String username = "root";
    private static final String password= "";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reponse() {
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
		String user=request.getParameter("username");
		String titre=request.getParameter("titre");
		String debut=request.getParameter("date_d");
		String retour=request.getParameter("date_r");

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
        if("Refuser".equals(action)) {
        	try {
            	PreparedStatement delete = connexion.prepareStatement("DELETE FROM requests where username =? AND titre=?");
            	delete.setString(1, user);
            	delete.setString(2, titre);

            	int ok = delete.executeUpdate();
                request.getRequestDispatcher("Admin_profile.jsp").forward(request, response);
            }catch (SQLException e) {
                throw new ServletException(e);
            }
        }
        if("Accepter".equals(action)) {
        	try {
            	
            	
            	PreparedStatement add = connexion.prepareStatement("INSERT INTO emprunt VALUES(?,?,?,?)");
            	add.setString(1, titre);
            	add.setString(2, user);
            	
            	add.setString(3, debut);
            	add.setString(4, retour);
            	
            	int done = add.executeUpdate();
            	
            	PreparedStatement moins = connexion.prepareStatement("Update livre SET exemplaires=exemplaires-1 where titre=?");
            	moins.setString(1, titre);
            	int moin = moins.executeUpdate();
            	
            	PreparedStatement delete = connexion.prepareStatement("DELETE FROM requests where username =? AND titre=?");
            	delete.setString(1, user);
            	delete.setString(2, titre);
            	int ok = delete.executeUpdate();
            	
            	request.getRequestDispatcher("Admin_profile.jsp").forward(request, response);
            	
            }catch (SQLException e) {
                throw new ServletException(e);
            }
        }

	}

}
