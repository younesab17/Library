<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestion des Livres</title>
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
form {
    text-align:left;
    margin-bottom: 0px ; /* Ajout d'une marge en haut et en bas pour l'aérer */
}

label {
    display: block;
    margin-bottom: 0px;
    font-size: 1em;
    color: #27ae60; /* Utiliser la couleur principale de la page */
}

select, input {
    margin: 5px;
    padding: 8px;
    font-size: 1em;
    border: 1px solid #ddd;
    border-radius: 5px;
}


    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 8px;
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

    .btn-edit {
      background-color: #3498db; /* Bleu clair */
      
    }

    .btn-delete {
      background-color: #e74c3c; /* Rouge */
    }

    .btn:hover {
      opacity: 0.8;
    }

    section a{
        font-size: 12px;
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
    <h1><a href="home.html">TranquilLire</a></h1>
    <img src="Logo.png" alt="Logo de la Bibliothèque XYZ" height="50">
  </header>

  <nav>
     <form action="Data" method="post">
    	<input type="submit" value="Dashboard" 	name="action"  class="link-boutton">
    	<input type="submit" value="Clients" 	name="action" class="link-boutton">
    	<input type="submit" value="Emprunts" 	name="action"  class="link-boutton">
    	<input type="submit" value="Demandes" 	name="action"  class="link-boutton">
    </form>
  </nav>

  <section>
    <h2>Gestion des Livres <a href="Ajout_livre.jsp" class="btn btn-add">Ajouter un livre</a></h2>
    
    
    <form method="get" action="Data">
    
    <label for="searchType">Rechercher par :</label>
    
    <select name="searchType" id="searchType">
    	<option value="None" >Par ?</option>
        <option value="titre">Titre</option>
        <option value="auteur">Auteur</option>
        <option value="genre">Genre</option>
    </select>
    
    <input type="text" name="searchTerm" placeholder="Entrez votre recherche">
    
    <input type="submit" value="Rechercher"  class="btn-edit">

</form>

 <%  @SuppressWarnings("unchecked")
    List<List<String>> livres = (List<List<String>>) request.getAttribute("livres");
 	int i=0;
 	for (List<String> livre : livres) { i++; }
 	if(i>0){ %>
 	<table >
        <thead>
            <tr>
                <th>Titre</th>
                <th>Auteur</th>
                <th>Genre</th>           
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
      <%   for (List<String> livre : livres) { 
%>

    
        

            <tr>
                <td><%= livre.get(0) %></td>
                <td><%= livre.get(1) %></td>
                <td><%= livre.get(2) %></td>
                
                
                <td>
                    <form method="post" action="delete">
                    <input type="hidden" name="titre" value="<%= livre.get(0) %>">
                    <input type="submit" value="Retirer" name="action" class="btn-delete">
                    </form>

                </td>
            </tr>
<%
        }
%>
        </tbody>
    </table>
<%
 	}else {
%>
    <p>Aucun livre à afficher.</p>
<%
    }
%>
  </section>

  <footer>
    <p>&copy; 2023 Bibliothèque TranquilLire. Tous droits réservés.</p>
  </footer>
</body>
</html>
