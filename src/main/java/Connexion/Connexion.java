package Connexion;

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

/**
 * Servlet implementation class Connexion
 */
public class Connexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

  	private static final String url = "jdbc:mysql://localhost:3306/biblio";
    private static final String username = "root";
    private static final String password= "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Connexion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		session.invalidate();
		response.sendRedirect("Direction.jsp");
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
		String user=request.getParameter("username");
		String mp=request.getParameter("password");
		Connection connexion = null;
        try {
            connexion = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        try {
        	PreparedStatement selection = connexion.prepareStatement("SELECT * FROM user WHERE username= ? AND password= ?");
        	selection.setString(1, user);
        	selection.setString(2, mp);

            ResultSet resultat = selection.executeQuery();
            int i=0;
            String role ="";
            while (resultat.next()) {
            	
                i++;
                role=resultat.getString("role");
            }
            if(i>0) {
            	HttpSession session = request.getSession();
            	 session.setAttribute("username", user);
            	 session.setAttribute("role", role);

            	 response.sendRedirect("Direction.jsp ");
            	
            }
            else {
            	request.setAttribute("message", "Merci de verifier vos infos de connexion !!");
            	request.getRequestDispatcher("/Login.jsp").forward(request, response);
            }

	}catch (SQLException e) {
        throw new ServletException(e);
    }
        try {
            connexion.close();
        } catch (SQLException e) {
            throw new ServletException(e);
        }

}
}
