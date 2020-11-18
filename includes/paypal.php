<?php


require 'paypal/autoload.php';

define('URL_SITIO', 'http://localhost:80/gdlwebcamp');

$apiContext = new \PayPal\Rest\ApiContext(
      new \PayPal\Auth\OAuthTokenCredential(
          'ARdHoCGtQff4xqAJNlbjj00CjLyQCbnFOoDknaGCfyNHc-NGtabsR-hIMAeC1VsTUVHC21Q0mKgbtakw',  // ClienteID
          'EBjZrODjaMjyU3a9TrMfRWWpd1nd7SJisG5qC0lFYVM7NgCWFGd6vXeyPlEBBNn7oWV3H3j-akDmSAWv'  // Secret
      )
);

