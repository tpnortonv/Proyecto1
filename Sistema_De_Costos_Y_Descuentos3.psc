Algoritmo Sistema_De_Costos_Y_Descuentos3
	
	Definir Precio, Precio1, Precio2, Total, TotalIVA, DescuentoXCantidad, DescuentoCupon, IVA, CostoEnvio, Peso, CostoXKg, CostoPeso Como Real
	Definir Producto, Destino Como Caracter
	Definir Cantidad, Pedidos Como Entero
	
	IVA <- 0.12
	DescuentoCupon <- 0.10
	DescuentoXCantidad <- 0.05
	CostoEnvio <- 10 //Fijo, independiente del destino.
	CostoXKg <- 2
	
	Dimension Pedidos[3] //Supuesto de 3 compras por usuario para usar arreglos.
	
	Para i <- 1 Hasta 3 Hacer
		Escribir "Ingrese Producto:"
		Leer Producto
		Escribir "Ingrese precio:"
		Leer Precio
		Escribir "Ingrese cantidad:"
		Leer Cantidad
		
		Precio1 = Precio * Cantidad
		
		Escribir "Total1:$", Precio * Cantidad
		Escribir "Tienes un cupón (10%)! Nuevo total:$", Precio1 - (Precio1 * DescuentoCupon)
		
		Total = Precio1 - (Precio1 * DescuentoCupon)
		
		Escribir "Precio + IVA (19%):$" Total * (1 + IVA)
		
		TotalIVA = Total * (1 + IVA)
		
		Si Cantidad >= 2 Entonces
			Escribir "Aplica descuento por cantidad (5%), Nuevo Total:$", TotalIVA - (TotalIVA * DescuentoXCantidad)
		SiNo
			Escribir "No aplica descuento por Cantidad, Nuevo total permanece igual:$", TotalIVA
		FinSi
		
		Escribir "Ingrese destino a enviar su compra:"
		Leer Destino
		Escribir "Ingrese el peso de su paquete en Kg:"
		Leer Peso
		
		Precio2 = TotalIVA * DescuentoXCantidad
		CostoPeso = CostoXKg * Peso
		
		Si Cantidad >= 2 Entonces
			Escribir "Total a pagar:$" (TotalIVA - Precio2) + CostoEnvio + CostoPeso
		SiNo
			Escribir "Total a pagar:$", TotalIVA + CostoEnvio + CostoPeso
		FinSi
		
		Escribir "Desglose de su compra"
		Escribir "Descuento por cupón..........$", Precio1 * DescuentoCupon
		Escribir "Impuesto (IVA):..............$", TotalIVA - Total
		
		Si Cantidad < 2 Entonces
			Escribir "Descuento por cantidad:......$", 0
		SiNo
			Escribir "Descuento por cantidad:......$", TotalIVA * DescuentoXCantidad
		FinSi
		
		Escribir "Costo de envío:..............$", CostoEnvio + CostoPeso
	Fin para
	
FinAlgoritmo
