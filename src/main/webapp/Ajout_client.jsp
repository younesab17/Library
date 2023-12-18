<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ajout d'un Client</title>
  <style>
    body {
      background-color: #ecf0f1; /* Couleur de fond l�g�rement grise */
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    header {
      background-color: #27ae60; /* Vert �meraude */
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
      margin-bottom: 50px; /* Marge inf�rieure pour le formulaire */
    }

    h2 {
      color: #27ae60; /* Vert �meraude */
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
      font-size: 1.2em; /* Taille de police l�g�rement augment�e */
      border: none; /* Suppression de la bordure par d�faut */
    }

    .btn-primary {
      background-color: #27ae60; /* Vert �meraude */
    }

    .btn:hover {
      opacity: 0.8; /* L�g�re r�duction de l'opacit� au survol */
    }

    .signup-message {
      color: #888;
      margin-top: 10px;
    }

    .signup-message a {
      color: #27ae60; /* Vert �meraude */
    }

    footer {
      text-align: center;
      padding: 0,5em;
      position: fixed;
      bottom: 0;
      width: 100%;
      background-color: #27ae60; /* Vert �meraude */
      color: #fff;
    }
  </style>
</head>
<body>
  <header>
    <h1><a href="home.html">TranquilLire</a></h1>
    <img src="Logo.png" alt="Logo de la Biblioth�que XYZ" height="50">
  </header>

  <nav>
     <form action="Data" method="post">
    	<input type="submit" value="Dashboard" 	name="action"  class="link-boutton">
    	<input type="submit" value="Clients" 	name="action" class="link-boutton">
    	<input type="submit" value="Livres"  	name="action"  class="link-boutton">
    	<input type="submit" value="Emprunts" 	name="action"  class="link-boutton">
    </form>
  </nav>

  <section>
    <h2>Ajout d'un Client</h2>
   	<form action="Add" method="post" onsubmit="return validateForm()" >
	  <div>
        <input type="text" placeholder="Nom d'utilisateur" name="username" required>
        <input type="text" placeholder="CIN" name="cin" required>
      </div>
      <div>
        <input type="password" placeholder="Mot de passe" name="password" required>
        <input type="password" placeholder="Confirmer le mot de passe" required>
      </div>
      <div>
        <input type="tel" placeholder="T�l�phone" name="tlf" required>
        <input type="text" placeholder="Adresse" name="adresse" required>
      </div>
      
      <div class="button-wrapper">
        <button type="submit" class="btn btn-primary" name="add">Ajouter</button>
      </div>
    </form>
  </section>
	
	
	
	<script>
        
        var Error = '<%= request.getAttribute("message") %>';
        if(Error == "Ce username est d�j� utilis�"){
        	   alert(Error);
        }
    
        function validateForm() {
            var username = document.getElementById("username").value;
            var cin = document.getElementById("cin").value;

            var adresse = document.getElementById("adresse").value;
            var telephone = document.getElementById("telephone").value;
            
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            // V�rification si nom et pr�nom sont alphab�tiques
            if (password.length < 6) {
                alert("Le mot de passe doit avoir au moins 6 caract�res.");
                return false;
            }
            if (password !== confirmPassword) {
                alert("Le mot de passe et la confirmation ne correspondent pas.");
                return false;
            }
            
            if (!isAlpha(username) || !isAlpha(adresse)) {
                alert("Le username ou l'adresse doivent �tre alphab�tiques.");
                return false;
            }

            // V�rification si le t�l�phone a 8 chiffres
            if (!isValidPhone(telephone)||!isValidPhone(CIN)) {
                alert("Le num�ro de t�l�phone ou CIN doit contenir 8 chiffres.");
                return false;
            }

            // V�rification si le mot de passe a au moins 10 caract�res
            

            // V�rification si le mot de passe et la confirmation sont similaires
            

            return true; // Soumettre le formulaire si toutes les v�rifications passent
        }

        function isAlpha(input) {
            var regex = /^[a-zA-Z]+$/;
            return regex.test(input);
        }

        function isValidPhone(input) {
            var regex = /^[0-9]{8}$/;
            return regex.test(input);
        }

    </script>
  <footer>
    <p>&copy; 2023 Biblioth�que TranquilLire. Tous droits r�serv�s.</p>
  </footer>
</body>
</html>
