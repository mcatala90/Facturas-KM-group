
		$(document).ready(function(){
			load(1);
			$( "#resultados" ).load( "ajax/editar_facturacion.php" );
		});

		function load(page){
			var q= $("#q").val();
			$("#loader").fadeIn('slow');
			$.ajax({
				url:'./ajax/productos_factura.php?action=ajax&page='+page+'&q='+q,
				 beforeSend: function(objeto){
				 $('#loader').html('<img src="./img/ajax-loader.gif"> Cargando...');
			  },
				success:function(data){
					$(".outer_div").html(data).fadeIn('slow');
					$('#loader').html('');
					
				}
			})
		}

	function agregar (id)
		{
			var precio_venta=5;
			var cantidad= 3;
			$.ajax({
        type: "POST",
        url: "./ajax/editar_facturacion.php",
        data: "id="+id+"&precio_venta="+precio_venta+"&cantidad="+cantidad,
		 beforeSend: function(objeto){
			$("#resultados").html("Mensaje: Cargando...");
		  },
        success: function(datos){
		$("#resultados").html(datos);
		}
			});
		}
		
		//producto
			function eliminar(id)
		{
			
			$.ajax({
        type: "GET",
        url: "./ajax/editar_facturacion.php",
        data: "id="+id,
		 beforeSend: function(objeto){
			$("#resultados").html("Mensaje: Cargando...");
		  },
        success: function(datos){
		$("#resultados").html(datos);
		}
			});

		}

		function eliminar_partida(id_partida)
		{
			var r = confirm("Si borras la partida tambien se borraran los productos agregados a esta!");
			if (r == true) {
					 
			$.ajax({
				type: "GET",
				url: "./ajax/editar_facturacion.php",
				data: "id_partida="+id_partida,
				 beforeSend: function(objeto){
					$("#resultados").html("Mensaje: Cargando...");
				  },
				success: function(datos){
				$("#resultados").html(datos);
				}
					});
			
				} 	
		
		}
		
		$("#datos_factura").submit(function(event){
		  var id_cliente = $('option:selected','#nombre_cliente').attr('value');
	  
		  if (id_cliente==""){
			 
			  $("#nombre_cliente").focus();
			  return false;
		  }
			var parametros = $(this).serialize();
			console.log(parametros);
			$.ajax({
					type: "POST",
					url: "ajax/editar_factura.php",
					data: parametros,
					 beforeSend: function(objeto){
						$(".editar_factura").html("Mensaje: Cargando...");
					  },
					success: function(datos){
						$(".editar_factura").html(datos);
					}
			});
			
			 event.preventDefault();
	 	});
		
		$( "#guardar_cliente" ).submit(function( event ) {
		  $('#guardar_datos').attr("disabled", true);
		  
		 var parametros = $(this).serialize();
			 $.ajax({
					type: "POST",
					url: "ajax/nuevo_cliente.php",
					data: parametros,
					 beforeSend: function(objeto){
						$("#resultados_ajax").html("Mensaje: Cargando...");
					  },
					success: function(datos){
					$("#resultados_ajax").html(datos);
					$('#guardar_datos').attr("disabled", false);
					load(1);
				  }
			});
		  event.preventDefault();
		})
		
		$( "#guardar_producto" ).submit(function( event ) {
		  $('#guardar_datos').attr("disabled", true);
		  
		 var parametros = $(this).serialize();
		
	     var id_partida = $('#id_partida').html(); 
			 $.ajax({
					type: "POST",
					url: "ajax/nuevo_producto.php?id_partida="+id_partida,
					data: parametros,
					 beforeSend: function(objeto){
						$("#resultados_ajax_productos").html("Mensaje: Cargando...");
					  },
					success: function(datos){
					$("#resultados_ajax_productos").html(datos);
					$('#guardar_datos').attr("disabled", false);
					
				  }
			});
		  event.preventDefault();
		})

		$( "#guardar_partida" ).submit(function( event ) {
 		$('#guardar_datos').attr("disabled", true);	
		 
		 var parametros = $(this).serialize();
         var numero_factura = $('#numero_factura').html();
		 $.ajax({
					  type: "POST",
					  url: "ajax/nueva_partida.php?numero_factura="+numero_factura,
					  data: parametros,
					   beforeSend: function(objeto){
						  $("#resultados_ajax_partida").html("Mensaje: Cargando...");
						},
					  success: function(datos){
					  $("#resultados_ajax_partidas").html(datos);
					  $('#guardar_datos').attr("disabled", false);
					  $( "#resultados" ).load( "ajax/editar_facturacion.php" );
					  $("#nuevaPartida").modal('hide');
					}
			  });
			event.preventDefault();
		  })
  

		function imprimir_factura(id_factura){
			VentanaCentrada('./pdf/documentos/ver_factura.php?id_factura='+id_factura,'Factura','','1024','768','true');
		}