<?php
include('is_logged.php');//Archivo verifica que el usario que intenta acceder a la URL esta logueado
	/*Inicia validacion del lado del servidor*/
	 
	 if (empty($_POST['nombre'])){
			$errors[] = "Nombre del producto vacío";
		} else if ($_POST['cantidad'] < 0){
			$errors[] = "La cantidad debe ser mayor a 0";
		} else if (empty($_POST['precio'])){
			$errors[] = "Precio de venta vacío";
		} else if (
			!empty($_POST['cantidad']) &&
			!empty($_POST['nombre']) &&
			!empty($_POST['precio'])
		){
		/* Connect To Database*/
		require_once ("../config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
		require_once ("../config/conexion.php");//Contiene funcion que conecta a la base de datos
		// escaping, additionally removing everything that could be (html/javascript-) code
		function randLetter()
		{
			$int = rand(0,51);
			$a_z = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
			$rand_letter = $a_z[$int];
			return $rand_letter;
		}

		$codigo=randLetter().mt_rand(100,999).randLetter();
		$id_partida = $_GET['id_partida'];
		if(empty($id_partida)){
		
			$id_partida = 0;
		}
		$nombre=mysqli_real_escape_string($con,(strip_tags($_POST["nombre"],ENT_QUOTES)));
		$estado=1;
		$cantidad=intval($_POST['cantidad']);
		$precio_venta=floatval($_POST['precio']);
		$date_added=date("Y-m-d H:i:s");
		$sql="INSERT INTO products (codigo_producto, nombre_producto, status_producto, date_added, precio_producto) VALUES ('$codigo','$nombre','$estado','$date_added','$precio_venta')";
		$query_new_insert = mysqli_query($con,$sql);
			if ($query_new_insert){
				$messages[] = "Producto ha sido ingresado satisfactoriamente.";
			} else{
				$errors []= "Lo siento algo ha salido mal intenta nuevamente.".mysqli_error($con);
			}
		} else {
			$errors []= "Error desconocido.";
		}
		
		if (isset($errors)){
			
			?>
			<div class="alert alert-danger" role="alert">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong>Error!</strong> 
					<?php
						foreach ($errors as $error) {
								echo $error;
							}
						?>
			</div>
			<?php
			}
			if (isset($messages)){
				
				?>
				<div class="alert alert-success" role="alert">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong>¡Bien hecho!</strong>
						<?php
							foreach ($messages as $message) {
									echo $message;
								}
						
								$sql=mysqli_query($con, "select MAX(id_producto) AS last FROM products");
								$rw=mysqli_fetch_array($sql);
								$numero_producto=$rw['last'];	
						?>
					   <script>

                         setTimeout(function(){ 
							 
					 add_new('<?php echo $numero_producto; ?>');  

						  }, 1000);

					 function add_new(id)
		{
			var precio_venta=<?php echo $precio_venta; ?>;
			var cantidad= <?php echo $cantidad; ?>;
			var id_partida = <?php echo $id_partida; ?>;
			$.ajax({
        type: "POST",
        url: "ajax/editar_facturacion.php",
        data: "id="+id+"&precio_venta="+precio_venta+"&cantidad="+cantidad+"&id_partida="+id_partida,
		 beforeSend: function(objeto){
			$("#resultados").html("Mensaje: Cargando...");
		  },
        success: function(datos){
		$("#resultados").html(datos);
		}
			});
		}
					   </script>
							
				</div>
				<?php
			}

?>