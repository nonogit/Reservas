----- inspecciono registros con reserva menor a $100 al 20140630
SELECT top 100 *
  FROM [Actuarial].[dbo].[RSP_menores_a_100_201406]

 SELECT top 100 *
  FROM [Exportacion].[dbo].[simba_stro] where fec_proc = '201406'
-------------------------------------------------------------------------------------------------------


----- cruzo reservas menores a 100 con maestro de siniestros UK (simbastro)
SELECT a.*, b.*
  FROM [Actuarial].[dbo].[RSP_menores_a_100_201406] a
  left join [Exportacion].[dbo].[simba_stro] b 
  on a.sec = b.cod_sec and a.stro = substring(b.cod_stro_di,7,7)*1 and a.sstro = substring(b.cod_stro_di,17,3)*1
  and a.Ejer = substring(b.cod_stro_di,3,4)*1 and b.fec_proc = '201406'
------------------------------------------------------------------------------------------------


----- chequeo casos puntuales
SELECT fec_proc as fecha_reserva, *
  FROM [Exportacion].[dbo].[simba_stro] 
  where substring(cod_stro_di,7,7)*1 = 8013107 and
  cod_sec = 1
  order by fecha_reserva desc

SELECT fec_proc as fecha_reserva, *
  FROM [Exportacion].[dbo].[simba_stro] 
  where substring(cod_stro_di,7,7)*1 = 8013110 and
  cod_sec = 1
  order by fecha_reserva desc

SELECT fec_proc as fecha_reserva, *
  FROM [Exportacion].[dbo].[simba_stro] 
  where substring(cod_stro_di,7,7)*1 = 8487749 and
  cod_sec = 4
  order by fecha_reserva desc

SELECT fec_proc as fecha_reserva, *
  FROM [Exportacion].[dbo].[simba_stro] 
  where substring(cod_stro_di,7,7)*1 = 8488190 and
  cod_sec = 4
  order by fecha_reserva desc

-----------------------------------------------------------------------------------------------

