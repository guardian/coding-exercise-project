# Add portable sbt to path
$env:PATH += ";" + (Convert-Path "./sbt/sbt/bin" )  + ";"

sbt ~test