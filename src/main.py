from flask import Flask, render_template_string
import requests
import os

app = Flask(__name__)

PRODUCT_SERVICE_URL = os.getenv("PRODUCT_SERVICE_URL", "http://localhost:3001")
ORDER_SERVICE_URL = os.getenv("ORDER_SERVICE_URL", "http://localhost:3002")

HTML_TEMPLATE = """
<!DOCTYPE html>
<html>
<head><title>DevOps Store</title></head>
<body>
    <h1>DevOps Store</h1>
    <h2>Products</h2>
    <ul>
    {% for p in products %}
        <li>{{ p.name }} - ${{ p.price }}</li>
    {% endfor %}
    </ul>
</body>
</html>
"""

@app.route("/")
def index():
    try:
        products = requests.get(f"{PRODUCT_SERVICE_URL}/api/products").json()
    except Exception:
        products = []
    return render_template_string(HTML_TEMPLATE, products=products)

@app.route("/health")
def health():
    return {"status": "ok"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)