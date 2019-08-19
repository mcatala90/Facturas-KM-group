<?php 
	if ($con){
?>
    <table cellspacing="0" style="width: 100%;">
        <tr>

            <td width="33%" height="394" style="width: 33%; color: #444444;"><span style="width: 50%; color: #34495e;font-size:12px;text-align:center"><span style="color: #34495e;font-size:14px;font-weight:bold"><?php echo get_row('perfil','nombre_empresa', 'id_perfil', 1);?></span> <br />
                <?php echo get_row('perfil','direccion', 'id_perfil', 1).", ". get_row('perfil','ciudad', 'id_perfil', 1)." ".get_row('perfil','estado', 'id_perfil', 1);?><br />
Teléfono: <?php echo get_row('perfil','telefono', 'id_perfil', 1);?><br />
Email: <?php echo get_row('perfil','email', 'id_perfil', 1);?> </span><br>
                
            </td>
			<td width="33%" style="width: 33%; color: #34495e;font-size:12px;text-align:center"><span style="width: 25%; color: #444444;"><img src="../../<?php echo get_row('perfil','logo_url', 'id_perfil', 1);?>" alt="Logo" width="20%" height="100" style="width: 100px;" /></span></td>
			<td width="33%" style="width: 33%;text-align:right">
			FACTURA Nº <?php echo $numero_factura;?>
			</td>
			
        </tr>
    </table>
	<?php }?>	