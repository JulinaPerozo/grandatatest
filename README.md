# TEST FROM GRANDATA COMPANY

## Description
Objetivos de este test:
1. Calcular el monto total que facturará el proveedor del servicio por envíos de sms.
2. Generar un dataset que contenga los ID de los 100 usuarios con mayor facturación por
envío de sms y el monto total a facturar a cada uno. Además del ID, incluir el ID hasheado mediante el algoritmo MD5. Escribir el dataset en formato parquet con compresión gzip.
3. Graficar un histograma de cantidad de llamadas que se realizan por hora del día.
4. Respuestas a preguntas generales.

Repositorio de GitHub

El código y los recursos para este proyecto se encuentran disponibles en GitHub en el siguiente link de forma pública:

https://github.com/JulinaPerozo/grandatatest

## Technical Requirements

- Notebook: Jupyter o Zeppelin
- Framework de procesamiento: Spark v2.3
- Lenguajes de programación: Scala 2.11 o Python 3.6
- Docker y Docker Compose

## * Objetivo 1:
- Calcular el monto total que facturará el proveedor del servicio por envíos de sms.
  
            +-----------+
            |costo_total|
            +-----------+
            |  1696022.5|
            +-----------+

## * Objetivo 2:
- Generar un dataset que contenga los ID de los 100 usuarios con mayor facturación por
envío de sms y el monto total a facturar a cada uno. Además del ID, incluir el ID hasheado mediante el algoritmo MD5. Escribir el dataset en formato parquet con compresión gzip.

            +--------------------+-------+
            |           ID_SOURCE|  costo|
            +--------------------+-------+
            |911914c7729eedbdf...|18573.0|
            |bd180b7811395cbce...|13508.0|
            |14a0660ae2f5d1868...| 4070.0|
            |16c222aa19898e505...| 1707.0|
            |bc97b32ee2abb9c18...| 1292.5|
            |6a57072949dbc409c...| 1026.0|
            |f5a45e33602ea62f9...| 1023.5|
            |e9d076deb3451cc49...| 1015.5|
            |1b2e80021b5fc82bf...|  892.0|
            |159e1f3d6ff0e7c3c...|  714.5|
            |4e321438558549248...|  702.0|
            |aeb3135b436aa5537...|  680.0|
            |496ce5f942d15eefb...|  652.0|
            |beed13602b9b0e6ec...|  626.5|
            |aa35b36e4d1395542...|  616.0|
            |e87c495061191f4df...|  611.5|
            |2823f4797102ce1a1...|  610.5|
            |11b921ef080f77360...|  605.5|
            |13d8d90116cbacd3a...|  603.5|
            |49159f42b0f043d6d...|  592.5|
            +--------------------+-------+

## * Objetivo 3:
3. Graficar un histograma de cantidad de llamadas que se realizan por hora del día.

  <img width="970" alt="image" src="https://github.com/JulinaPerozo/grandatatest/blob/main/hist.png">



## * Obetivo 4:
4. Respuestas a preguntas generales

## ¿Cómo priorizaría los procesos productivos sobre los procesos de análisis exploratorios?

- Se podrían asignar más recursos a los procesos productivos y limitaría los de análisis. Usaría colas de prioridad en Hadoop (YARN) para asegurar que los procesos críticos siempre tengan más recursos.

## Debido a que los procesos productivos del pipeline poseen un uso intensivo tanto de CPU como de memoria, ¿qué estrategia utilizaría para administrar su ejecución durante el día? ¿qué herramientas de scheduling conoce para tal fin?
- Ejecutaría los procesos productivos en horas de menor uso o cuando hay menos carga. A pesar de que existen varias herramientas de scheduling, recomiendo usar Airflow para programar y priorizar los procesos a lo largo del día.

## Existe una tabla del Data Lake con alta transaccionalidad, que es actualizada diariamente con un gran volumen de datos. Consultas que cruzan información con esta tabla ven afectada su performance en tiempos de respuesta.
Según su criterio, ¿cuáles serían las posibles causas de este problema? Dada la respuesta anterior, qué sugeriría para solucionarlo.

- Algunas posibles causas del problema podrían ser que la tabla con alta transaccionalidad genere mucho movimiento de datos, lo que puede saturar los recursos del sistema; además de índices inadecuados en las consultas ya que esto puede hacer que éstas sean lentas; otra posible causa puede ser la falta de memoria para trabajar la carga de trabajo y así afectar el rendimiento de la misma.

- Ahora bien, mencionando lo anterior, algunas sugerencias para resolver el problema, serían optimizar los índices, analizar y crear los índices necesarios en las columnas que más se utilizan en las consultas para mejorar la velocidad de acceso. Revisar las particiones de la tabla, la tabla en particiones más pequeñas puede ayudar a mejorar el rendimiento de las consultas.
También sería adecuado revisar para asegurarnos de que el sistema tenga suficientes recursos para el manejo de las consultas y cargas.

## Imagine un clúster Hadoop de 3 nodos, con 50 GB de memoria y 12 cores por nodo. Necesita ejecutar un proceso de Spark que utilizará la mitad de los recursos del clúster, dejando la otra mitad disponible para otros jobs que se lanzarán posteriormente.
¿Qué configuraciones en la sesión de Spark implementaría para garantizar que la mitad del clúster esté disponible para los jobs restantes? Proporcione detalles sobre la asignación de recursos, configuraciones de Spark, y cualquier otra configuración relevante.

Dado que el clúster tiene 3 nodos con 50 GB de memoria y 12 núcleos por nodo, podríamos configurar cada executor con 25 GB como máximo, que vendría a ser la mitad de los 50 GG disponibles, y también limitar la cantidad de cores por executor. Podriamos consigurar que quede de esta manera:

spark.executor.memory=25g
spark.executor.cores=12
spark.executor.instances 

Este último nos ayudará a controlar los executors desplegados y que no se consuman los recursos en su totalidad.



Julina Perozo A.
Data Engineer Sr
