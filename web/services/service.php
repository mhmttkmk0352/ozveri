<?php
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);


    require_once("../class/DBase.php");
    $caller = Caller::Add( "DB" );
    $mysql = Caller::get("DB");
    
    $komut=$_GET["komut"];

    if ( $komut == "hash" ){
        $kullanici_adi = $_GET["kullanici_adi"];
        $parola = $_GET["parola"];
        
        $query = $mysql->query('SELECT hash FROM personeller WHERE kullanici_Adi="'.$kullanici_adi.'" AND parola="'.$parola.'"')->fetchAll( PDO::FETCH_ASSOC );
        if ( sizeof($query) == 1 ){
            $hash = $query[0]["hash"];
            echo json_encode( array("status"=>1, "hash"=>$hash) );
        }
        else{
            echo json_encode( array("status"=>0, "message"=>"Böyle bir kullanıcı yok !") );
        }
    }
    else if ( $komut == "ekle" ){
        $hash = $_GET["hash"];
        $latitude = $_GET["latitude"];
        $longitude = $_GET["longitude"];

        $query = $mysql->query('SELECT hash FROM personeller WHERE hash="'.$hash.'"')->fetchAll( PDO::FETCH_ASSOC );
        if ( sizeof($query) > 0 ){
            $mysql->query('INSERT INTO koordinatlar(hash,latitude,longitude, active) VALUES("'.$hash.'","'.$latitude.'","'.$longitude.'", 1)');
            echo json_encode( array("status"=>1, "message"=>"Başarılı") );
        }
        else{
            echo json_encode( array("status"=>0, "message"=>"Böyle bir kullanıcı yok !") );
        }
    }
    else if( $komut == "liste" ){
        $query = $mysql->query('SELECT * FROM koordinatlar where active=1')->fetchAll( PDO::FETCH_ASSOC );
        if ( sizeof( $query ) > 0 ){
            echo json_encode( array("status"=>1, "data"=>$query) );

        }
    }
    else if ( $komut == "guncelle" ){
        $id = $_GET["id"];
        $query = $mysql->query('UPDATE koordinatlar SET active=0 where id='.intval($id));
        echo json_encode( array("status"=>1, "message"=>"Kaldırıldı") );
    }
    else{
        echo json_encode( array("status"=>0, "message"=>"Parametre Girmediniz !") );
    }

    


?>