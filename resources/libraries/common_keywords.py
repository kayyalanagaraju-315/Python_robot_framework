from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options  # Import ChromeOptions
from webdriver_manager.chrome import ChromeDriverManager


def get_driver(url):
    chrome_options = Options()
    
    chrome_options.add_argument("--start-maximized")
    chrome_options.add_argument("--force-device-scale-factor=0.80")
    chrome_options.add_experimental_option("detach", True)
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)
    driver.get(url)
    
    return driver