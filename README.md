# Sistema de Costos y Descuentos en Pseint

## Descripción

Este algoritmo en Pseint calcula el costo total de una compra en función de varios factores, incluyendo el precio del producto, la cantidad comprada, descuentos aplicables, IVA, y costos de envío. Está diseñado para manejar hasta 3 compras por usuario y proporciona un desglose detallado del costo final.

## Funcionalidades

1. **Cálculo de Precio Inicial**: Calcula el costo total basado en el precio del producto y la cantidad comprada.
2. **Aplicación de Descuentos**:
   - **Cupón**: Descuento del 10% aplicable a todas las compras.
   - **Cantidad**: Descuento adicional del 5% si la cantidad comprada es 2 o más.
3. **Cálculo del IVA**: Aplica un IVA del 12% al total después de aplicar descuentos.
4. **Costo de Envío**:
   - Costo fijo de envío de $10.
   - Costo adicional basado en el peso del paquete (2$ por kg).
5. **Desglose Detallado**: Muestra un desglose de los costos, incluyendo descuentos aplicados, IVA, y costos de envío.

## Instrucciones de Ejecución

1. **Ejecutar el Algoritmo**: Abre Pseint y copia el código en un nuevo archivo.
2. **Ingresar Datos**:
   - Para cada compra, ingresa el nombre del producto, el precio unitario, la cantidad deseada, el destino del envío, y el peso del paquete.
3. **Revisar Resultados**: El algoritmo imprimirá el total a pagar y un desglose de los costos después de aplicar descuentos, IVA, y costos de envío.

## Código

```pseint
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
		
		Escribir "Precio + IVA (12%):$" Total * (1 + IVA)
		
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
