# Jooksvõistlus Read Me 
***Sellel saidil viisin läbi jooksja võistluse simulatsiooni. Siin saab lisada ja eemaldada jooksjaid, samuti alustada ja lõpetada võistlust. Samuti veebileht näitab jooksjate parimad tulemused***

![pilt](https://github.com/artursuskevits/Jooksvoistlus/assets/120181393/3c7b76c2-eb5b-4ce5-9488-f8b557222363)


**Kõik failid kaustas Jooks2:**
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

## Veevileehe registreerimine
Registreerimiseks oleme kirjutanud php-koodi, mis kontrollib, kas andmed *(sisselogimine ja parool)* on õigesti sisestatud. Vaikimisi antakse kõigile kasutajatele tavalise kasutaja roll. Andmebaasi abil on võimalik teha kasutajast administraator.

## Sisse Logimine
Logis kontrollime, kas andmebaasis on selliste andmetega kasutaja olemas ***ja suuname ta seejärel ümber saidile***

## Kasutaja võimalused

### Jooksja lisamine
Pärast saidile sisenemist suunatakse kasutaja lehele, kus ta saab lisada soovitud jooksja, ***kui ta ei ole juba osalevate jooksjate nimekirjas.***
![pilt](https://github.com/artursuskevits/Jooksvoistlus/assets/120181393/c666833a-9eef-4137-8add-78ef50255dae)
### Tulemuste vaade
Pärast võistluse lõppu saab kasutaja näha kolme parima jooksja tulemusi ***ja ka nende võidetud medaleid.***


## Administratoori võimalused

### 1. Jooksja lisamine ja Tulemuste vaade
Administraator saab tulemusi vaadata ja lisada konkurente samamoodi ***nagu tavakasutaja.***
![pilt](https://github.com/artursuskevits/Jooksvoistlus/assets/120181393/fa7e9e5b-4a62-4c26-9274-2aea5a058efb)

### 2 .Jooksjate andmete muutamine
Pärast veebilehele sisselogimist suunatakse administraator ***Amini paneelile***, kus ta saab muuta kõiki osaleja andmeid _(eesnimi, perekonnanimi, algus- ja lõpuaeg)._

### 3. Võistluse alustamine
Administraator saab määrata kõigile osalejatele algusaeg **leheküljel "Start"***.  Samuti saab administraator sellel lehel kustutada osalejad, kes ei peaks võistlusel osalema.

### 4. Võistluse lõputamine
Pärast seda, kui jooksja on ületanud finišijoone ***leheküljel "Lõpp"***, saab administratsioon määrata jooksja lõpuaja

## Kasutaja välja logimine
Kui kasutaja on teinud kõik, mida ta soovib teha, saab ta klõpsata väljumisnuppu või sulgeda brauseri vahekaardi.

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
