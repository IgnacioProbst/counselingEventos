<?php 

include_once 'funciones/funciones.php';

if(isset($_POST['agregar-admin'])) {

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

?>