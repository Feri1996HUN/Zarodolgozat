<!-- Adatbázis -->

<?php
class Dbconnect{

    protected $host;
    protected $user;
    protected $pwd;
    protected $con;

    function __construct(){
        $this->host = "localhost";
        $this->user = "root";
        $this->pwd = "";
    }

    function Connection($dbname){
        try {
            $this->con = new PDO("mysql:host=$this->host; dbname=$dbname", $this->user, $this->pwd);
            $this->con->exec("set names 'utf8'");
        } catch (PDOException $e) {
            die("<h1>Adatbázis kapcsolódási hiba!</h1>");
        }
    }

    function Bejelentkezes($user, $pwd){
        $tomb = null;

        $res = $this->con->prepare("SELECT `Nev`, `Jelszo` FROM `users` WHERE nev = ? AND jelszo = ?");
        $res->bindparam(1, $user);
        $res->bindparam(2, $pwd);
        $res->execute();

        while ($row = $res->fetch()) {
            $tomb[] = $row;
        }
        
        return $tomb;
    }

    function selectUpload(){
    $tomb = null;

    $res = $this->con->prepare("SELECT nev, ID_user FROM users");
    $res->execute();

    while ($row = $res->fetch()) {
        $tomb[] = $row;
    }
    
    return $tomb;
    }

    function iktat($datum, $userid, $targy, $comment){
        $res = $this->con->prepare("INSERT INTO `letters`(`erkezett`, `ID_user`, `targy`, `leiras`) VALUES (:erkezett,:ID_user,:targy,:leiras)");

        $res->bindparam("erkezett", $datum);
        $res->bindparam("ID_user", $userid);
        $res->bindparam("targy", $targy);
        $res->bindparam("leiras", $comment);

        $res->execute();
    }

    function lista($uid, $dattol, $datig){
        $tomb = null;
        $res = $this->con->prepare("SELECT * FROM letters WHERE (erkezett BETWEEN :datumtol AND :datumig) AND ID_user = :ID_user");

        $res->bindparam("ID_user", $uid);
        $res->bindparam("datumtol", $dattol);
        $res->bindparam("datumig", $datig);

        $res->execute();

    // Az eredmény halmazt kimentjük a tömbbe
    while ($row = $res->fetch()) {
    $tomb[] = $row;
    }
    
    return $tomb;
    }

    function regisztracio($user, $pwd, $iranyitoszam, $utca, $hazszam, $emelet, $ajto, $email, $telefon){
        $res = $this->con->prepare("INSERT INTO `users`(`Nev`, `Jelszo`, `Iranyitoszam`, `Utca`, `Hazszam`, `Emelet`, `Ajto`, `Email`, `Telefon`) VALUES (:nev,:jelszo,:irszam,:utca,:hsz,:em,:ajto,:email,:tel)");

        $res->bindparam("nev", $user);
        $res->bindparam("jelszo", $pwd);
        $res->bindparam("irszam", $iranyitoszam);
        $res->bindparam("utca", $utca);
        $res->bindparam("hsz", $hazszam);
        $res->bindparam("em", $emelet);
        $res->bindparam("ajto", $ajto);
        $res->bindparam("email", $email);
        $res->bindparam("tel", $telefon);
        $res->execute();
    }



}
?>