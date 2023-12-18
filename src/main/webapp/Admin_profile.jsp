<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>
  <style>
    /* ... Votre style CSS existant ... */

    /* Ajoutez des styles spécifiques pour le tableau de bord ici */

    body {
      background-color: #ecf0f1; /* Couleur de fond légèrement grise */
    }

    .dashboard-section {
      max-width: 800px;
      margin: 20px auto;
      padding: 20px;
      margin-top: 15%;
      padding-top: 30px;
      padding-bottom: 50px;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      text-align: center;
    }
/* Style du formulaire */
form {
  text-align: center;
}

/* Style des boutons du formulaire */
.link-boutton {
  display: inline-block;
  margin: 0 20px;
  padding: 10px 5px;
  color: rgb(52, 219, 83); /* Couleur du texte */
  text-decoration: none;
  border: 2px solid rgb(52, 219, 83); /* Couleur de la bordure */
  border-radius: 5px;
  font-size: 1.2em;
  background-color: #fff; /* Couleur de fond */
  cursor: pointer;
  transition: background-color 0.3s, color 0.3s, border-color 0.3s;
}

/* Style au survol des boutons */
.link-boutton:hover {
  background-color: rgb(52, 219, 83); /* Couleur de fond au survol */
  color: #fff; /* Couleur du texte au survol */
  border-color: #fff; /* Couleur de la bordure au survol */
}

	.logout-button {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    border: 2px solid #d9534f; /* Couleur de la bordure */
    color: #d9534f; /* Couleur du texte */
    background-color: #fff; /* Couleur de fond */
    border-radius: 5px;
    transition: background-color 0.3s, color 0.3s;
}

/* Style au survol du bouton */
.logout-button:hover {
    background-color: #d9534f; /* Couleur de fond au survol */
    color: #fff; /* Couleur du texte au survol */
}
   

    
  </style>
</head>

<body>
 
  <section class="dashboard-section">
    <h2>Tableau de bord</h2>
    <p>     Bienvenue, <%= session.getAttribute("username") %>  !</p>

    <div class="dashboard-links">
    <form action="Data" method="post">
    	<input type="submit" value="Clients" 	name="action" class="link-boutton">
    	<input type="submit" value="Livres"  	name="action"  class="link-boutton">
    	<input type="submit" value="Emprunts" 	name="action"  class="link-boutton">
    	<input type="submit" value="Demandes" 	name="action"  class="link-boutton">
    </form>
      
        <br><br>
      <form action="Connexion" method="get">
      <input type="submit" value ="logout" class="logout-button">  
      </form>
    </div>
  </section>
</body>
</html>
