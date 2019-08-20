<?php
	/*-------------------------
	Autor: Obed Alvarado
	Web: obedalvarado.pw
	Mail: info@obedalvarado.pw
	---------------------------*/
include('is_logged.php');//Archivo verifica que el usario que intenta acceder a la URL esta logueado
$id_factura= $_SESSION['id_factura'];
$numero_factura= $_SESSION['numero_factura'];
if (isset($_POST['id'])){$id=intval($_POST['id']);}
if (isset($_POST['cantidad'])){$cantidad=intval($_POST['cantidad']);}
if (isset($_POST['precio_venta'])){$precio_venta=floatval($_POST['precio_venta']);}

	/* Connect To Database*/
	require_once ("../config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
	require_once ("../config/conexion.php");//Contiene funcion que conecta a la base de datos
	//Archivo de funciones PHP
	include("../funciones.php");
if (!empty($id) and !empty($cantidad) and !empty($precio_venta))
{
	$cantidad=intval($_POST['cantidad']);
	$id_partida = $_POST['id_partida'];
	if(empty($id_partida)){
	
		$id_partida = 0;
	}
$insert_tmp=mysqli_query($con, "INSERT INTO detalle_factura (numero_factura, id_producto,cantidad,precio_venta,id_partida) VALUES ('$numero_factura','$id','$cantidad','$precio_venta','$id_partida')");

}
if (isset($_GET['id']))//codigo elimina un elemento del array
{
$id_detalle=intval($_GET['id']);	
$delete=mysqli_query($con, "DELETE FROM detalle_factura WHERE id_detalle='".$id_detalle."'");
}

if (isset($_GET['id_partida']))//Eliminar partida
{
$id_partida=intval($_GET['id_partida']);	
$delete=mysqli_query($con, "DELETE FROM partidas  WHERE id_partida='".$id_partida."'");
$delete=mysqli_query($con, "DELETE FROM detalle_factura  WHERE id_partida='".$id_partida."'");
}

$simbolo_moneda=get_row('perfil','moneda', 'id_perfil', 1);

?>


<?php $sql=mysqli_query($con, "select * from partidas where partidas.numero_factura='$numero_factura'");
while ($row=mysqli_fetch_array($sql))
{
	$partida = $row['id_partida'];
	$sql_partidas=mysqli_query($con, "select nombre_partida from partidas where id_partida='$partida'");
	$row_partida = mysqli_fetch_array($sql_partidas);
    $nombre_partida = $row_partida['nombre_partida'];	 ?>
		
		<div align="left" class="partida_box">
	<h4 style="color:#31708F;">
		<b><?php echo $nombre_partida; ?></b>		
		</h4>

	
		</div>
		
	<br>
<table class="table" id="partida<?php echo $partida; ?>">
	
<tr>
<th>CONCEPTO</th>
<th class='text-right'>PRECIO UNIT.</th>
<th class='text-center'>CANT.</th>
<th class='text-right'>PRECIO TOTAL</th>
	<th></th>
</tr>

</table>
<table class="table">
<tr>
<div class="pull-right">
				
				<button type="button" class="btn btn-warning pull-right" onclick="eliminar_partida(<?php echo $partida;?>)">
				<b>X</b> Eliminar partida
				</button>
				<button type="button" class="btn btn-primary" style="margin-right:10px;" data-toggle="modal" data-target="#nuevoProducto" value="<?php echo $partida ?>" onclick="document.getElementById('id_partida').innerHTML=this.value">
				<span class="glyphicon glyphicon-plus"></span> Agregar producto
				</button>		
					</div>	
</tr>
</table>

<?php
}  ?>

	<table class="table" id="partida0">
	<tr>
	
	<th>CONCEPTO</th>
<th class='text-right'>PRECIO UNIT.</th>
<th class='text-center'>CANT.</th>
<th class='text-right'>PRECIO TOTAL</th>
		<th></th>
	</tr>
	</table>
<?php 
$sql_b=mysqli_query($con, "select * from products, facturas, detalle_factura where facturas.numero_factura=detalle_factura.numero_factura and  facturas.id_factura='$id_factura' and products.id_producto=detalle_factura.id_producto");

	$sumador_total=0;
	while ($row_details=mysqli_fetch_array($sql_b))
	{
	
	$id_to_append = $row_details['id_partida'];	
	$id_detalle=$row_details["id_detalle"];
	$codigo_producto=$row_details['codigo_producto'];
	$cantidad=$row_details['cantidad'];
	$nombre_producto=$row_details['nombre_producto'];
	
	
	$precio_venta=$row_details['precio_venta'];
	$precio_venta_f=number_format($precio_venta,2);//Formateo variables
	$precio_venta_r=str_replace(",","",$precio_venta_f);//Reemplazo las comas
	$precio_total=$precio_venta_r*$cantidad;
	$precio_total_f=number_format($precio_total,2);//Precio total formateado
	$precio_total_r=str_replace(",","",$precio_total_f);//Reemplazo las comas
	$sumador_total+=$precio_total_r;//Sumador
	$nombre_producto =  str_replace(array("\r\n", "\r"), "<br>",$nombre_producto);
	
		?>

		<script>
       var n_p = "<?php echo $nombre_producto; ?>";
	  
		 $("#partida<?php echo $id_to_append; ?>").append("<tr><td>"+n_p+"</td><td class='text-right'><?php echo $precio_venta_f;?></td><td class='text-center'><?php echo $cantidad;?></td><td class='text-right'><?php echo $precio_total_f;?></td><td class='text-center'><a  onclick='eliminar(<?php echo $id_detalle ?>)'><i class='glyphicon glyphicon-trash'></i></a></td></tr>");
		</script>
		
		<?php
	}
	$impuesto=get_row('perfil','impuesto', 'id_perfil', 1);
	$subtotal=number_format($sumador_total,2,'.','');
	$total_iva=($subtotal * $impuesto )/100;
	$total_iva=number_format($total_iva,2,'.','');
	$total_factura=$subtotal+$total_iva;
	$update=mysqli_query($con,"update facturas set total_venta='$total_factura' where id_factura='$id_factura'");
?>
	<button type="button" class="btn btn-primary pull-right" style="margin-right:10px;margin-bottom:10px;" data-toggle="modal" data-target="#nuevoProducto" value="0" onclick="document.getElementById('id_partida').innerHTML=this.value">
				<span class="glyphicon glyphicon-plus"></span> Producto Extra
				</button>
<table class="table">
<tr>
	<td class='text-right' colspan=4>SUBTOTAL <?php echo $simbolo_moneda;?></td>
	<td class='text-right'><?php echo number_format($subtotal,2);?></td>
	<td></td>
</tr>
<tr>
	<td class='text-right' colspan=4>IVA (<?php echo $impuesto;?>)% <?php echo $simbolo_moneda;?></td>
	<td class='text-right'><?php echo number_format($total_iva,2);?></td>
	<td></td>
</tr>
<tr>
	<td class='text-right' colspan=4>TOTAL <?php echo $simbolo_moneda;?></td>
	<td class='text-right'><?php echo number_format($total_factura,2);?></td>
	<td></td>
</tr>

</table>
