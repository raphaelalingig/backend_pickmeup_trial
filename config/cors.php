<?php
return [
    'paths' => ['api/*', 'sanctum/csrf-cookie'],
    'allowed_methods' => ['*'],
    'allowed_origins' => [
        'http://localhost:3000', 
        'https://backendpickmeup-production.up.railway.app',
        'https://adminpickmeup.vercel.app',
        'http://192.168.1.16:8000'
        ],  
        
    'allowed_origins_patterns' => [],
    'allowed_headers' => ['*'],
    'exposed_headers' => [],
    'max_age' => 0,
    'supports_credentials' => true,
];
