<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestion des Emprunts</title>
 <style>
    body {
      background-color: #ecf0f1; /* Couleur de fond légèrement grise */
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    header {
      background-color: #27ae60; /* Vert émeraude */
      color: #fff;
      padding: 0.3em;
      text-align: center;
      height: 150px;
    }

    header h1 a {
      text-decoration: none;
      color: #fff;
      cursor: pointer;
    }

    nav {
      background-color: #2ecc71; /* Vert plus clair */
      padding: 10px 0;
      text-align: center;
    }


    section {
      max-width: 800px;
      margin: 20px auto;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }

    h2 {
      color: #27ae60; /* Vert émeraude */
    }

    .btn-add {
      background-color: rgb(14, 136, 65); /* Vert clair */
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 10px;
      text-align: left;
    }

    th {
      background-color: #27ae60;
      color: #fff;
    }

    .btn {
      display: inline-block;
      padding: 8px 16px;
      margin: 0 5px;
      color: #fff;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

.btn {
  display: inline-block;
  padding: 8px 6px;
  margin: 0 2px;
  color: #fff;
  text-decoration: none;
  border-radius: 5px;
  transition: background-color 0.3s ease;
}



.btn-edit {
  background-color: #3498db; /* Bleu clair */
  margin-left: 15px;
}

.btn-delete {
  background-color: blue; /* Rouge */
}

    footer {
      text-align: center;
      padding: 0.5em;
      position: fixed;
      bottom: 0;
      width: 100%;
      background-color: #27ae60; /* Vert émeraude */
      color: #fff;
    }
     form {
  text-align: center;
}

/* Style des boutons du formulaire */
.link-boutton {
  display: inline-block;
  margin: 0 20px;
  padding: 10px 5px;
  color: rgb(255, 255, 255); /* Couleur du texte */
  text-decoration: none;
  border: none;
  /*border: 2px solid rgb(52, 219, 83); /* Couleur de la bordure */
  border-radius: 5px;
  font-size: 1.2em;
  background-color:  #2ecc71; /* Couleur de fond */
  cursor: pointer;
  transition: background-color 0.3s, color 0.3s, border-color 0.3s;
}

/* Style au survol des boutons */
.link-boutton:hover {
  background-color: rgb(0, 0, 0); /* Couleur de fond au survol */
  color: #fff; /* Couleur du texte au survol */
  border-color: #fff; /* Couleur de la bordure au survol */
}
  </style>
</head>
<body>
      <header>
    <h1><a href="home.jsp">TranquilLire</a></h1>
    <img src="Logo.png" alt="Logo de la Bibliothèque XYZ" height="50">
  </header>

  <nav>
     <form action="ClientData" method="post">
     	<input type="submit" 	value="Dashboard" 	name="action"  class="link-boutton">
     	<input type="submit" 	value="Livres"		name="action"  class="link-boutton">
    	<input type="submit" 	value="Demandes"  	name="action"  class="link-boutton">
    	
    </form>
  </nav>

  <section>
    <h2>Historique des Emprunts </h2>
<% @SuppressWarnings("unchecked")
    List<List<String>> emprunts = (List<List<String>>) request.getAttribute("emprunts");

    if (emprunts != null && !emprunts.isEmpty()) {
    	
%>
    <table>
      <thead>
        <tr>
          <th>Client</th>
          <th>Livre</th>
          <th>Date d'emprunt</th>
          <th>Date de retour prévue</th>
          <th>Staut</th>
        </tr>
      </thead>
      <%
        for (List<String> emprunt : emprunts) {
%>
      <tbody>
        <tr>
          <td><%= emprunt.get(0) %></td>
          <td><%= emprunt.get(1) %></td>    
          <td><%= emprunt.get(2) %></td>
          <td><%= emprunt.get(3) %></td>
          
          <%

          


// Convertir la date de retour en objet Date
Date dateRetour = new SimpleDateFormat("yyyy-MM-dd").parse(emprunt.get(3));
Date dateDebut = new SimpleDateFormat("yyyy-MM-dd").parse(emprunt.get(2));


// Récupérer la date système
Date dateSysteme = new Date();

// Comparer les dates
if (dateSysteme.before(dateRetour)) {
    // La date de retour est ultérieure à la date système, l'emprunt est "en cours"
%>
    <td>
        <button class="btn btn-delete">En cours</button>
    </td>
<%
} else if (dateSysteme.after(dateRetour)) {
    // La date de retour est antérieure à la date système, l'emprunt est "terminé"
%>
    <td>
        <button class="btn btn-delete">Terminé</button>
    </td>
<%}
 
%>
        </tr> 

      <%  }
        
%>
        </tbody>
    </table>
<%
    } else {
%>
    <p>Aucun Emprunt à afficher</p>
<%
    }
%>

  </section>

  <footer>
    <p>&copy; 2023 Bibliothèque TranquilLire. Tous droits réservés.</p>
  </footer>
</body>
</html>
