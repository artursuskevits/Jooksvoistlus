# Jooksvoistlus Read Me 


 <picture>
  <img alt="Shows an illustrated sun in light mode and a moon with stars in dark mode." src="https://marathon100-cdn.fra1.digitaloceanspaces.com/images/news/p/berliinipoolmaraton021-G9JQ8v8TU6zc7zQ5Yp3r7ETCaNbV4h43.jpg">
</picture>

[Saidi link](https://artursuskevits22.thkit.ee/Jooks2/jooksmain.php)

**Kõik failis:**
1. adminleht.php
2. autasustamise.php
3. conf.php
4. fromsstyle.css
5. jookja.css
6. jookjaScript.js
7. jooks.html
8. jooksjad.jpg
9. jooksmain.php
10. login.php
11. logo.png
12. logout.php
13. lopp.php
14. registration.php
15. start.php

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
**Tulemuste sorteerissüsteem:**
```
$TOPResults = array_slice($ResultArray, 0, 3);
?>
<div id="top-results">
    <h2>Top 3 Tulemusi</h2>
    <ul class="leaderboard">
        <?php foreach ($TOPResults as $index => $result) : ?>
            <li class="leaderboard-item">
                <span class="rank"><?= $index + 1 ?></span>
                <span class="medal"><?= ($index == 0) ? '🥇' : (($index == 1) ? '🥈' : '🥉') ?></span>
                <span class="name"><?= $result['nimi'] . ' ' . $result['perenimi'] ?></span>
                <span class="time"><?= $result['difference'] ?> sekundid</span>
            </li>
        <?php endforeach; ?>
```

## Administratoori võimalused

### Jooksja lisamine ja Tulemuste vaade
Administraator saab tulemusi vaadata ja lisada konkurente samamoodi ***nagu tavakasutaja.***

### Muta jooksja
Pärast veebilehele sisselogimist suunatakse administraator ***Amini paneelile***, kus ta saab muuta kõiki osaleja andmeid _(eesnimi, perekonnanimi, algus- ja lõpuaeg)._

### Võistluse alustamine
Administraator saab määrata kõigile osalejatele algusaeg **leheküljel "Start"***.  Samuti saab administraator sellel lehel kustutada osalejad, kes ei peaks võistlusel osalema.

### Võistluse lõputamine
Pärast seda, kui jooksja on ületanud finišijoone ***leheküljel "Lõpp"***, saab administratsioon määrata jooksja lõpuaja
