# jupyter and spark3 connect

- there is only python3 kernel

```SHELL
jupyter kernelspec list
```

```SHELL
cat $HOME/$USER/delab-venv/share/jupyter/kernels/python3/kernel/json
```

- let's creat for pyspark3

```SHELL
mkdir $HOME/$USER/delab-venv/share/jupyter/kernels/pyspark3
```

```SHELL
vi $HOME/$USER/delab-venv/share/jupyter/kernels/pyspark3/kernel.json
```

```JSON
{
      "argv": [
        "python",
        "-m",
        "ipykernel_launcher",
        "-f",
        "{connection_file}"
      ],
      "display_name": "Pyspark 3",
      "language": "python",
      "env": {
        "PYSPARK_PYTHON": "/usr/bin/python3",
        "SPARK_HOME": "/opt/spark3/",
        "SPARK_OPTS": "--master yarn --conf spark.ui.port=0",
        "PYTHONPATH": "/opt/spark3/python/lib/py4j-0.10.7-src.zip:/opt/spark3/python/"
      }
}
```



```SHELL
jupyter kernelspec install $HOME/$USER/delab-venv/share/jupyter/kernels/pyspark3 --user
```

- let's check
  
```SHELL
jupyter kernelspec list
```

- open jupyter lab ui on browser and you will see pyspark2 notebook.

```PYTHON
from pyspark.sql import SparkSession
```
```PYTHON
spark = SparkSession. \
    builder. \
    enableHiveSupport(). \
    appName('Demo'). \
    master('yarn'). \
    getOrCreate()
```
```PYTHON
spark.sql('SHOW databases').show()
```
```PYTHON
spark.sql('SELECT count(1) FROM retail_db.orders').show()
```
