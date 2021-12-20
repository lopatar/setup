<?php

function redirect($host, $query_string = '') {
    $url = $host . $query_string;
    header("Location: $url");
}

$host = $_SERVER['HTTP_HOST'];

$invidious_instances = [
    'https://invidious.namazso.eu',
    'https://invidious.snopyta.org',
    'https://invidious.kavin.rocks'
];

$privatebin_instances = [
    'https://paste.nolog.cz',
    'https://bin.disroot.org',
    'https://bin.snopyta.org'
];

$upload_instances = [
    'https://upload.nolog.cz',
    'https://upload.disroot.org'
];

$nitter_instances = [
    'https://nitter.snopyta.org',
];

$host_parts = explode('.', $host);

$host = ($host_parts[0] === 'www') ? $host_parts[1] . '.' .  $host_parts[2] : $host_parts[0] . '.' . $host_parts[1];

switch ($host) {
    case 'youtube.com':
        redirect($invidious_instances[random_int(0, count($invidious_instances) - 1)], $_SERVER['REQUEST_URI']);
        break;
    case 'youtu.be':
        $request_uri = '/watch?v=' . substr($_SERVER['REQUEST_URI'], 1);
        redirect($invidious_instances[random_int(0, count($invidious_instances) - 1)], $request_uri);
        break;
    case 'pastebin.com':
        redirect($privatebin_instances[random_int(0, count($privatebin_instances) - 1)]);
        break;
    case 'translate.google.com':
        redirect('https://lingva.ml');
        break;
    case 'translator.google.com':
        redirect('https://lingva.ml');
        break;
    case 'anonfiles.com':
        redirect($upload_instances[random_int(0, count($upload_instances) - 1)]);
        break;
    case 'twitter.com':
        redirect($nitter_instances[random_int(0, count($nitter_instances) - 1)], $_SERVER['REQUEST_URI']);
        break;
    case 'google.com':
        redirect('https://duckduckgo.com');
        break;
    case 'google.cz':
        redirect('https://duckduckgo.com');
        break;
}

?>
