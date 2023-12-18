<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bibliothèque XYZ - Inscription</title>
  <style>
    body {
      background-color: #f5f5f5; /* Gris clair */
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    header {
      background-color: #27ae60; /* Vert émeraude */
      color: #fff;
      padding: 0.3em;
      text-align: center;
      height: 150px; /* Hauteur réduite */
    }

    header h1 a {
        text-decoration: none; /* Supprime le soulignement du lien */
        color: #fff; /* Couleur du texte du lien */
        cursor: pointer; /* Change le curseur au survol */
      }
      
      header h1 a:hover {
        text-decoration: none; /* Aucun soulignement même au survol */
      }

    nav {
      background-color: #2ecc71; /* Vert plus clair */
      padding: 10px 0;
      text-align: center;
      margin-bottom: 20px; /* Espacement en bas */
    }

    nav a {
      display: inline-block;
      margin: 0 10px;
      padding: 10px 20px;
      color: #fff;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    nav a:hover {
      background-color: #1f8b4c; /* Vert plus foncé au survol */
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
    <h1><a href="Home.jsp">TranquilLire</a></h1>
    <img src="Logo.png" alt="Logo de la Bibliothèque XYZ" height="50">
  </header>

  <nav>
    <a href="about.html">À propos</a>
    <a href="contact.html">Contact</a>
    <a href="catalog.html">Catalogue</a>
    <a href="hours.html">Horaires</a>
    <a href="services.html">Services</a>
  </nav>

  <section>
    <h2>Inscription à la Bibliothèque TranquilLire</h2>
    
    <form action="Register" method="post" onsubmit="return validateForm()">
      <div>
        <input type="text" placeholder="Nom d'utilisateur" name="username" id="username" required>
        <input type="text" placeholder="CIN" name="cin" id="cin" required>
      </div>
      <div>
        <input type="tel" placeholder="Téléphone" name="tlf" id="telephone" required>
        <input type="text" placeholder="Adresse" name="adresse" id="adresse" required>
      </div>
      <div>
        <input type="password" placeholder="Mot de passe" name="password" id="password" required>
        <input type="password" placeholder="Confirmer le mot de passe" id="confirmPassword" required>
      </div>
      <div class="button-wrapper">
        <button type="submit" class="btn btn-primary">S'inscrire</button>
      </div>
    </form>
    <p class="signup-message">Vous avez déjà un compte ? <a href="Login.jsp">Connectez-vous ici.</a></p>
  </section>
    <script>
        
        var Error = '<%= request.getAttribute("message") %>';
        if(Error == "Ce username est déjà utilisé"){
        	   alert(Error);
        }
        function validateForm() {
            var username = document.getElementById("username").value;
            var cin = document.getElementById("cin").value;

            var adresse = document.getElementById("adresse").value;
            var telephone = document.getElementById("telephone").value;
            
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            // Vérification si nom et prénom sont alphabétiques
            if (password.length < 6) {
                alert("Le mot de passe doit avoir au moins 6 caractères.");
                return false;
            }
            if (password !== confirmPassword) {
                alert("Le mot de passe et la confirmation ne correspondent pas.");
                return false;
            }
            
            if (!isAlpha(username) || !isAlpha(adresse)) {
                alert("Le username ou l'adresse doivent être alphabétiques.");
                return false;
            }

            // Vérification si le téléphone a 8 chiffres
            if (!isValidPhone(telephone)||!isValidPhone(CIN)) {
                alert("Le numéro de téléphone ou CIN doit contenir 8 chiffres.");
                return false;
            }


            

            return true; 
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
    <p>&copy; 2023 Bibliothèque TranquilLire. Tous droits réservés.</p>
  </footer>
</body>
</html>
