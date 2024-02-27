# Jooksvoistlus Read Me 


 <picture>
  <img alt="Shows an illustrated sun in light mode and a moon with stars in dark mode." src="https://marathon100-cdn.fra1.digitaloceanspaces.com/images/news/p/berliinipoolmaraton021-G9JQ8v8TU6zc7zQ5Yp3r7ETCaNbV4h43.jpg">
</picture>

## Registreerimine
Registreerimiseks oleme kirjutanud php-koodi, mis kontrollib, kas andmed *(sisselogimine ja parool)* on õigesti sisestatud. Vaikimisi antakse kõigile kasutajatele tavalise kasutaja roll. Andmebaasi abil on võimalik teha kasutajast administraator.

**See on Registreerimine kood :**
```
if (isset($_SESSION['ksautaja']) && isset($_SESSION['ksautajaid']))
    header("Location: ./jooksmain.php");  // redirect the user to the home page
if (isset($_POST['btn'])) {
    $username = $_POST['ksautaja'];
    $passwd = $_POST['salasona'];
    $passwd_again = $_POST['salasona2']
    global $yhendus;
    $kask= $yhendus->prepare("SELECT * FROM registration WHERE login=?");
    $kask->bind_param("s",$username);
    $kask->execute();
    if (!$kask->fetch()){
        $id = '';
        $sool='superpaev';
        $krypt=crypt($passwd, $sool);
        $passwd_hashed = $krypt;
        $date_created = time();
        $last_login = 0;
        $status = 1;
        if ($username != "" && $passwd != "" && $passwd_again != ""){
            if ($passwd === $passwd_again){
                if ( strlen($passwd) >= 5 && strpbrk($passwd, "!#$.,:;()")){
                    mysqli_query($yhendus, "INSERT INTO registration (login, pass) VALUES ('$username', '$passwd_hashed')");
                    $query = mysqli_query($yhendus, "SELECT * FROM registration WHERE login='{$username}'");
                    if (mysqli_num_rows($query) == 1){;
                        $success = true;
                    }
                }
                else
                    $error_msg = 'Teie salasõna ei ole piisavalt tugev. Lisa vähem 5 tähte ja 1 erimärk.';
            }
            else
                $error_msg = 'Teie paroolid ei sobinud.';
        }
        else
            $error_msg = 'Palun täitke kõik nõutavad väljad.';
    }
    else
        $error_msg = 'Kasutajanimi <i>'.$username.'</i> on juba hõivatud. Palun kasutage teist.';
}
else
?>
```

## Sisse Logida
Logis kontrollime, kas andmebaasis on selliste andmetega kasutaja olemas ***ja suuname ta seejärel ümber saidile***

## Kasutaja võimalused

### Jooksja lisamine
Pärast saidile sisenemist suunatakse kasutaja lehele, kus ta saab lisada soovitud jooksja, ***kui ta ei ole juba osalevate jooksjate nimekirjas.***

### Tulemuste vaade
Pärast võistluse lõppu saab kasutaja näha kolme parima jooksja tulemusi ***ja ka nende võidetud medaleid.***

## Administratoori võimalused


