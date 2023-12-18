<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Connexion</title>
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
    }

    h2 {
      color: #27ae60; /* Vert émeraude */
    }

    p {
      color: #555;
    }

    input {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      box-sizing: border-box;
      border-radius: 5px; /* Bordure arrondie */
      border: 1px solid #ddd; /* Bordure grise */
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
      padding: 1em;
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
    <h1>TranquilLire</h1>
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
    <h2>Connexion à la Bibliothèque TranquilLire</h2>
    <form action="Connexion" method="post">
      <input type="text" placeholder="Nom d'utilisateur" name="username" required>
      <input type="password" placeholder="Mot de passe" name="password" required>
      <div class="button-wrapper">
        <button type="submit" class="btn btn-primary">Se connecter</button>
      </div>
    </form>
    <p class="signup-message">Vous n'avez pas de compte ? <a href="Sign up.jsp">Inscrivez-vous ici.</a></p>
  </section>
  <script>
        
        var Error = '<%= request.getAttribute("message") %>';
        if(Error == "Merci de verifier vos infos de connexion !!"){
        	   alert(Error);
        }
    </script>
  <footer>
    <p>&copy; 2023 Bibliothèque TranquilLire. Tous droits réservés.</p>
  </footer>
</body>
</html>
