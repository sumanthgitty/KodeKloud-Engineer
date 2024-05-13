from flask import Flask

# the all-important app variable:
app = Flask(__name__)

@app.route("/")
def hello():
    return "Welcome to xFusionCorp Industries!"

if __name__ == "__main__":
        app.config['TEMPLATES_AUTO_RELOAD'] = True
        app.run(host='0.0.0.0', debug=True, port=8087)