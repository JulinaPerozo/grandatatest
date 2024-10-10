# Dockerfile para Grandata + Spark + Jupyter
FROM jupyter/pyspark-notebook:latest

# Instalar dependencias adicionales necesarias para el análisis
RUN pip install pandas matplotlib

# Exponer el puerto de Jupyter Notebook
EXPOSE 8888
