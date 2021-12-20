<?php

function redirect($host, $query_string = '') {
    $url = $host . $query_string;
    header("Location: $url");
}

function select_random($array) {
    return $array[random_int(0, count($array) + 1)];
}

$host = $_SERVER['HTTP_HOST'];

$invidious_instances = [
    'https://invidious.namazso.eu',
    'https://invidious.snopyta.org',
    'https://invidious.kavin.rocks',
    'https://yewtu.be'
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
    'https://nitter.net'
];

$host_parts = explode('.', $host);

$host = ($host_parts[0] === 'www') ? $host_parts[1] . '.' .  $host_parts[2] : $host_parts[0] . '.' . $host_parts[1];

switch ($host) {
    case 'youtube.com':
        redirect(select_random($invidious_instances), $_SERVER['REQUEST_URI']);
        break;
    case 'youtu.be':
        $request_uri = '/watch?v=' . substr($_SERVER['REQUEST_URI'], 1);
        redirect(select_random($invidious_instances), $request_uri);
        break;
    case 'pastebin.com':
        redirect(select_random($privatebin_instances));
        break;
    case 'translate.google.com':
        redirect('https://lingva.ml');
        break;
    case 'translator.google.com':
        redirect('https://lingva.ml');
        break;
    case 'anonfiles.com':
        redirect(select_random($upload_instances));
        break;
    case 'twitter.com':
        redirect(select_random($nitter_instances), $_SERVER['REQUEST_URI']);
        break;
    case 'google.com':
        redirect('https://duckduckgo.com');
        break;
    case 'google.cz':
        redirect('https://duckduckgo.com');
        break;
}

?>
