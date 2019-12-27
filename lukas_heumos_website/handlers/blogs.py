from flask import render_template
from ..app import app


@app.route("/blog_list")
def blog_list():
    return render_template("blog_list.html")


@app.route("/blog_article_1")
def blog_article_1():
    return render_template("blog_article_1.html")
