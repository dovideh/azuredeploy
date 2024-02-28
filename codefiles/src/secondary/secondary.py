import socket
import configparser
import sys
import time
from threading import Thread

# Load configuration
config = configparser.ConfigParser()
config.read('config.ini')
PRIMARY_HOST = config['SECONDARY']['PRIMARY_HOST']
PRIMARY_PORT = int(config['SECONDARY']['PRIMARY_PORT'])
SECONDARY_PORT = int(config['SECONDARY']['PORT'])
CHECK_INTERVAL = int(config['SECONDARY']['CHECK_INTERVAL'])

primary_online = True

def check_primary():
    global primary_online
    while True:
        try:
            with socket.create_connection((PRIMARY_HOST, PRIMARY_PORT), timeout=2):
                if not primary_online:
                    print("Primary is back online.")
                primary_online = True
        except socket.error:
            if primary_online:
                print("Primary is offline.")
            primary_online = False
        time.sleep(CHECK_INTERVAL)

def handle_client(connection, address):
    if primary_online:
        print(f"Rejecting connection from {address} because primary is online.")
        connection.close()
    else:
        print(f"Handling connection from {address} because primary is offline.")
        try:
            while True:
                data = connection.recv(1024)
                if not data:
                    break  # Connection closed by the client
                # Discard data explicitly
        finally:
            connection.close()

def main():
    check_thread = Thread(target=check_primary)
    check_thread.start()

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind(('0.0.0.0', SECONDARY_PORT))
        s.listen()
        print(f"Secondary listening on port {SECONDARY_PORT}...")
        while True:
            conn, addr = s.accept()
            client_thread = Thread(target=handle_client, args=(conn, addr))
            client_thread.start()

if __name__ == "__main__":
    main()

