<?php
return [
    'paths' => ['api/*'],
    'allowed_methods' => ['*'],
    'allowed_origins' => [
        'https://oyster-app-etowk.ondigitalocean.app',
        'http://localhost:3000', 
        'https://backendpickmeup-production.up.railway.app',
        'https://pickmeupadmin.xyz',
        'https://adminpickmeup-production.up.railway.app/'
        ],

    'allowed_origins_patterns' => [],
    'allowed_headers' => ['*'],
    'exposed_headers' => [],
    'max_age' => 0,
    'supports_credentials' => false,
];
