& .\.venv\Scripts\activate.ps1




robot -i Testing -d .\reports .\tests\test_case.robot

# pabot --pabotlib --processes 2 --testlevelsplit -i Testing .\tests\test_case.robot