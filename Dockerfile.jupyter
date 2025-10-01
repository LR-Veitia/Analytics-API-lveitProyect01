# Usar la imagen oficial de Jupyter con Python
FROM jupyter/datascience-notebook:latest

# Cambiar al usuario root para instalar paquetes del sistema
USER root

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    postgresql-client \
    vim \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Cambiar de vuelta al usuario jovyan
USER jovyan

# Instalar paquetes Python específicos para nuestro proyecto
RUN pip install --no-cache-dir \
    fastapi \
    sqlmodel \
    psycopg2-binary \
    redis \
    pandas \
    plotly \
    seaborn \
    matplotlib \
    numpy \
    scipy \
    scikit-learn \
    jupyterlab-git \
    ipywidgets

# Habilitar la extensión de git para JupyterLab
RUN jupyter server extension enable --py jupyterlab_git

# Construir Jupyter Lab para habilitar extensiones
RUN jupyter lab build

# Exponer puerto de Jupyter Lab
EXPOSE 8888

# Comando por defecto para iniciar Jupyter Notebook
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''", "--NotebookApp.allow_root=True"]
