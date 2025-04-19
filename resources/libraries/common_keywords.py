from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options  # Import ChromeOptions
from webdriver_manager.chrome import ChromeDriverManager
from datetime import datetime

def get_driver(url):
    chrome_options = Options()
    
    chrome_options.add_argument("--start-maximized")
    chrome_options.add_argument("--force-device-scale-factor=0.80")
    chrome_options.add_experimental_option("detach", True)
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)
    driver.get(url)
    
    return driver

def Execution_TIme(start_time, end_time):
    start_time = datetime.strptime(start_time, "%H:%M:%S")
    end_time = datetime.strptime(end_time, "%H:%M:%S")
    execution_time = end_time - start_time
    
    return  execution_time