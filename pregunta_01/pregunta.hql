/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Compute la cantidad de registros por cada letra de la columna 1.
Escriba el resultado ordenado por letra. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (Words:chararray, Date:chararray, Number:int);
new_word = FOREACH data GENERATE Words AS word;
group_by = GROUP new_word BY word;
counter = FOREACH group_by GENERATE group, COUNT(new_word);
STORE counter INTO 'output' USING PigStorage(',');
