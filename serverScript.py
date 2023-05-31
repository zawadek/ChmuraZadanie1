import http.server
import socketserver
import datetime
from tzlocal import get_localzone

class MyHandler(http.server.SimpleHTTPRequestHandler):    
    def do_GET(self):
        # Get the local timezone
        local_timezone = get_localzone()

        current_datetime = datetime.datetime.now(local_timezone)

        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

        message = f"Adres IP klienta: {self.client_address[0]}<br>"
        message += f"Aktualny czas klienta: {current_datetime}<br>"
        message += f"Strefa czasowa klienta: {local_timezone}<br>"

        self.wfile.write(bytes(message, "utf8"))
        print(f"Start serwera u klienta: {current_datetime}")
        
        author = "Daniel Zawadka"
        print(f"Autor: {author}")

PORT = 8000

with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
    print(f"Serwer nasłuchuje na porcie {PORT}")
    httpd.serve_forever()
