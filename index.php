<?php
$quotes = json_decode(file_get_contents("jcvd_quotes.json"), true)["quotes"];
$random = $quotes[array_rand($quotes)];

echo "<h1>🐇 Lapin Bleu Jokes – Mode JCVD</h1>";
echo "<p>$random</p>";
?>

