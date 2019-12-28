from flask import render_template
from ..app import app


@app.route("/blog_list")
def blog_list():
    return render_template("blog_list.html")


@app.route("/blog/spark_service")
def spark_service():
    return render_template("spark-service.html")
