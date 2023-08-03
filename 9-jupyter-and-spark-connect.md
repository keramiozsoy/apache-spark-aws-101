# jupyter and spark connect


- there is only python3 kernel

```SHELL
jupyter kernelspec list
```

```SHELL
cat $HOME/$USER/delab-venv/share/jupyter/kernels/python3/kernel/json
```

- let's creat for pyspark2

```SHELL
mkdir $HOME/$USER/delab-venv/share/jupyter/kernels/pyspark2
```

```SHELL
vi $HOME/$USER/delab-venv/share/jupyter/kernels/pyspark2/kernel.json
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
      "display_name": "Pyspark 2",
      "language": "python",
      "env": {
        "PYSPARK_PYTHON": "/usr/bin/python3",
        "SPARK_HOME": "/opt/spark2/",
        "SPARK_OPTS": "--master yarn --conf spark.ui.port=0",
        "PYTHONPATH": "/opt/spark2/python/lib/py4j-0.10.7-src.zip:/opt/spark2/python/"
      }
}
```

```SHELL
jupyter kernelspec install $HOME/$USER/delab-venv/share/jupyter/kernels/pyspark2 --user
```
  
