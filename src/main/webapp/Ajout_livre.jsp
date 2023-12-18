<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ajout d'un Livre</title>
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
      background-color: #2c3e50; /* Couleur bleu-gris */
      padding: 10px 0;
      text-align: center;
    }

 nav form {
     
  text-align: center;
  
  display: flex;
  align-items: center;
  justify-content: center;


}

/* Style des boutons du formulaire */
nav .link-boutton {
  display: inline-block;
  margin: 0 20px;
  padding: 10px 5px;
  color: rgb(52, 219, 83); /* Couleur du texte */
  text-decoration: none;
  border: 2px solid rgb(52, 219, 83); /* Couleur de la bordure */
  border-radius: 5px;
  font-size: 1.2em;
  background-color: #2c3e50; /* Couleur de fond */
  cursor: pointer;
  transition: background-color 0.3s, color 0.3s, border-color 0.3s;
}

/* Style au survol des boutons */
nav .link-boutton:hover {
  background-color: rgb(52, 219, 83); /* Couleur de fond au survol */
  color: #fff; /* Couleur du texte au survol */
  border-color: #fff; /* Couleur de la bordure au survol */
}

    section {
      max-width: 400px;
      margin: 20px auto;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      text-align: center;
      margin-bottom: 50px; /* Marge inférieure pour le formulaire */
    }

    h2 {
      color: #27ae60; /* Vert émeraude */
    }

    p {
      color: #555;
    }

    form {
      display: grid;
      grid-gap: 10px;
    }

    input {
      width: calc(50% - 10px);
      padding: 10px;
      box-sizing: border-box;
      border-radius: 5px; /* Bordure arrondie */
      border: 1px solid #ddd; /* Bordure grise */
      display: inline-block;
      margin-bottom: 10px;
    }

    .button-wrapper {
      text-align: center;
    }

    .btn {
      display: inline-block;
      padding: 15px 30px;
      margin: 10px; /* Espacement autour des boutons */
      color: #fff;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s ease;
      font-size: 1.2em; /* Taille de police légèrement augmentée */
      border: none; /* Suppression de la bordure par défaut */
    }

    .btn-primary {
      background-color: #27ae60; /* Vert émeraude */
    }

    .btn:hover {
      opacity: 0.8; /* Légère réduction de l'opacité au survol */
    }

    .signup-message {
      color: #888;
      margin-top: 10px;
    }

    .signup-message a {
      color: #27ae60; /* Vert émeraude */
    }

    footer {
      text-align: center;
      padding: 0,5em;
      position: fixed;
      bottom: 0;
      width: 100%;
      background-color: #27ae60; /* Vert émeraude */
      color: #fff;
    }
  </style>
</head>
<body>
  <header>
    <h1><a href="home.jsp">TranquilLire</a></h1>
    <img src="Logo.png" alt="Logo de la Bibliothèque XYZ" height="50">
  </header>

  <nav>
     <form action="Data" method="post" onsubmit="return validateForm()">
    	<input type="submit" value="Dashboard" 	name="action"  class="link-boutton">
    	<input type="submit" value="Clients" 	name="action" class="link-boutton">
    	<input type="submit" value="Livres"  	name="action"  class="link-boutton">
    	<input type="submit" value="Emprunts" 	name="action"  class="link-boutton">
    </form>
  </nav>

  <section>
    <h2>Ajout d'un Livre</h2>
    <form action="Add" method="post" onsubmit="return validateForm()">
            <div>
                <input type="text" placeholder="Titre" name="Titre" id="titre" required>
                <input type="text" placeholder="Auteur" name="Auteur" id="auteur" required>
            </div>
            <div>
                <input type="text" placeholder="Genre" name="Genre" id="genre" required>
                <input type="number" placeholder="Nombre d'exemplaires" name="Exemplaires" id="exemplaire" required>
            </div>

            <div class="button-wrapper">
                <button type="submit" class="btn btn-primary" name="Ajouter">Ajouter le Livre</button>
            </div>
        </form>
  </section>

  <footer>
    <p>&copy; 2023 Bibliothèque TranquilLire. Tous droits réservés.</p>
  </footer>
      <script>
    	  var Error = '<%= request.getAttribute("message") %>';
      		if(Error == "Le titre de ce livre est déjà utilisé"){
      	   		alert(Error);
      		}
        function validateForm() {
            var titre = document.getElementById("titre").value;
            var auteur = document.getElementById("auteur").value;
            var genre = document.getElementById("genre").value;
            var exemplaire = document.getElementById("exemplaire").value;

            // Vérification si titre, auteur et genre sont alphabétiques
            if (!isAlpha(titre) || !isAlpha(auteur) || !isAlpha(genre)) {
                alert("Le titre, l'auteur et le genre doivent être alphabétiques.");
                return false;
            }

            // Vérification si le nombre d'exemplaires est un nombre positif
            if (isNaN(exemplaire) || exemplaire <= 0) {
                alert("Le nombre d'exemplaires doit être un nombre positif.");
                return false;
            }

            return true; // Soumettre le formulaire si toutes les vérifications passent
        }

        function isAlpha(input) {
            var regex = /^[a-zA-Z]+$/;
            return regex.test(input);
        }
    </script>
</body>   
</html>