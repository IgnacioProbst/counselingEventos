<?php 

include_once 'funciones/funciones.php';

if($_POST['registro'] == 'nuevo') {

    $usuario = $_POST['usuario'];
    $passwordd = $_POST['passwordd'];

    $opciones = array(
        'cost' => 12
    );

    $password_hashed = password_hash($passwordd, PASSWORD_BCRYPT, $opciones);

    try {
        include_once 'funciones/funciones.php'; 
        $stmt = $conn->prepare("INSERT INTO admins (usuario, hash_pass) VALUES (?,?)");
        $stmt->bind_param("ss", $usuario, $password_hashed);
        $stmt->execute();
        $id_registro = $stmt->insert_id;
        if($id_registro > 0){
            $respuesta = array(
                'respuesta' => 'exito',
                'id_admin' => $id_registro
            );
        }else {      
            $respuesta = array(
                'respuesta' => 'error',
            );
        }
        die(json_encode($respuesta));
        $stmt->close();
        $conn->close();
    }catch(Exception $e) {
        echo "Error: " . $e->getMessage();
    }
}

if($_POST['registro'] == 'actualizar') {

    $id_registro = $_POST['id_registro'];
    $usuario = $_POST['usuario'];
    $nuevo_password = $_POST['nuevo_password'];
    

    try {
        $opciones = array(
            'cost' => 12,
        );
        if(empty($_POST['nuevo_password']) && empty($_POST['repetir_password'])) {
            
            $stmt = $conn->prepare("UPDATE admins SET usuario = ?, actualizado = NOW() WHERE ID_admin = ?  ");
            $stmt->bind_param("si", $usuario, $id_registro);
            
        } else {
            $hash_password = password_hash($nuevo_password, PASSWORD_BCRYPT, $opciones);        
            $stmt = $conn->prepare("UPDATE admins SET usuario = ?,  hash_pass = ? WHERE ID_admin = ?  ");
            $stmt->bind_param("ssi", $usuario, $hash_password, $id_registro);
            
        }
        $stmt->execute();
        
        if($stmt->affected_rows) {
            $respuesta = array(
                'respuesta' => 'correcto',
                'id_actualizado' => $stmt->insert_id
            );
            
        } else {
            $respuesta = array(
                'respuesta' => 'error'
            );
        }
        $stmt->close();
        $conn->close();
        
    } catch(Exception $e) {
        $respuesta = array(
            'respuesta' =>  $e->getMessage()
        );
    }

    die(json_encode($respuesta));
}

if($_POST['registro'] == 'eliminar'){
    $id_borrar = $_POST['id']; 

    try {
        $stmt = $conn->prepare("DELETE FROM admins WHERE ID_admin = ? ");
        $stmt->bind_param("i", $id_borrar);
        $stmt->execute();
        if($stmt->affected_rows) {
            $respuesta = array(
                'respuesta' => 'correcto',
                'id_eliminado' => $id_borrar
            );

        } else {
            $respuesta = array(
                'respuesta' => 'error'
            );
        }
        $stmt->close();
        $conn->close();
        
    } catch(Exception $e) {
        $respuesta = array(
            'respuesta' =>  $e->getMessage()
        );
    }

    die(json_encode($respuesta));
}
?>