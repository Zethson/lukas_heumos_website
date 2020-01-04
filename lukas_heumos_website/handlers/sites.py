from flask import render_template, redirect, url_for, session, request, send_from_directory
from ..app import app


@app.route('/')
def root():
    return redirect(url_for('index'))


@app.route("/index")
def index():
    return render_template("index-line.html")


@app.route('/favicon.ico')
def favicon():
    return redirect(url_for('static', filename='images/icons/logo_1.5.jpg'), code=302)

#@app.route('/robots.txt')
@app.route('/sitemap.xml')
def static_from_root():
    return send_from_directory(app.static_folder, request.path[1:])


@app.route('/impressum')
def impressum():
    return render_template("impressum.html")


@app.route('/language/<language>')
def set_language(language=None):
    """
    This route is requested, whenever (and only if) the user changed the language manually
    """

    session['language'] = language
    return redirect(url_for('index'))


@app.before_request
def before_request():
    if request.url.startswith('http://'):
        url = request.url.replace('http://', 'https://', 1)
        code = 301
        return redirect(url, code=code)
