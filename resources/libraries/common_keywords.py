from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options  # Import ChromeOptions
from webdriver_manager.chrome import ChromeDriverManager
from datetime import datetime
import base64

# import tkinter as tk
# from tkinter import simpledialog

# def get_credentials():
#     root = tk.Tk()
#     root.withdraw()  # Hide the root window

#     username = simpledialog.askstring("Username", "Enter your username:")
#     password = simpledialog.askstring("Password", "Enter your password:", show='*')

#     u_name = username
#     p_word = password
#     print("Username:", u_name)
#     print("Password:", p_word)
#     return    u_name, p_word

# def get_driver(url):
#     chrome_options = Options()
    
#     chrome_options.add_argument("--start-maximized")
#     chrome_options.add_argument("--force-device-scale-factor=0.80")
#     chrome_options.add_experimental_option("detach", True)
#     driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)
#     driver.get(url)
    
#     return driver

def Execution_TIme(start_time, end_time):
    start_time = datetime.strptime(start_time, "%H:%M:%S")
    end_time = datetime.strptime(end_time, "%H:%M:%S")
    execution_time = end_time - start_time
    return  execution_time

def encrypt_password(password):
    password = password.encode('utf-8')
    password = base64.b64encode(password)
    password = password.decode('utf-8')
    print("Encrypted password:", password)
    return password   
    
def decrypt_password(password):
    password = password.encode("ascii")
    password = base64.b64decode(password)
    password = password.decode("ascii")
    print("Decrypted password:", password)    
    return password