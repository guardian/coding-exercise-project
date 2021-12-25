$env:PATH = $env:PATH + ";" + (Convert-Path . )

lein self-install

lein test