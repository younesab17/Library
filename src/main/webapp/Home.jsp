<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home page</title>
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
      padding: 0.5em;
      text-align: center;
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
      max-width: 800px;
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

    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
      grid-gap: 20px;
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
    }

    .btn-primary {
      background-color: #27ae60; /* Vert émeraude */
    }

    .btn-secondary {
      background-color: #e74c3c; /* Rouge */
    }

    .btn:hover {
      opacity: 0.8; /* Légère réduction de l'opacité au survol */
    }

    .signup-message {
      color: #888;
      margin-top: 10px;
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
    <img src="/Static/Logo.png" alt="Logo de la Bibliothèque" height="100">
  </header>

  <nav>
    <a href="about.html">À propos</a>
    <a href="contact.html">Contact</a>
    <a href="catalog.html">Catalogue</a>
    <a href="hours.html">Horaires</a>
    <a href="services.html">Services</a>
  </nav>

  <section>
    <h2>Bienvenue à la Bibliothèque TranquilLire</h2>
    <p>Découvrez notre collection de livres et plongez dans un monde d'aventures littéraires.</p>

    <div class="grid">
      <div class="button-wrapper">
        <a href="Login.jsp" class="btn btn-primary">Se connecter</a>
      </div>
      <div class="button-wrapper">
        <a href="Sign up.jsp" class="btn btn-secondary">S'inscrire</a>
        
      </div>
    </div>
  </section>

  <footer>
    <p>&copy; 2023 Bibliothèque TranquilLire. Tous droits réservés.</p>
  </footer>
</body>
</html>
