<?php

function greeting(): string {
    return "Hi there!";
}

if (basename(__FILE__) === basename($_SERVER['SCRIPT_FILENAME'] ?? '')) {
    echo greeting() . "\n";
}
