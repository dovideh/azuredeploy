import socket
import configparser
from threading import Thread

# Load configuration
config = configparser.ConfigParser()
config.read('config.ini')
HOST = config['PRIMARY']['HOST']
PORT = int(config['PRIMARY']['PORT'])

def handle_client(connection, address):
    try:
        print(f"Connection from {address} has been established.")
        while True:
            data = connection.recv(1024)
            if not data:
                break  # Connection closed by the client
            # Discard data explicitly
    finally:
        connection.close()

def main():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind((HOST, PORT))
        s.listen()
        print(f"Listening on {HOST}:{PORT}...")
        while True:
            conn, addr = s.accept()
            client_thread = Thread(target=handle_client, args=(conn, addr))
            client_thread.start()

if __name__ == "__main__":
    main()
