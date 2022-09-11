*** Settings ***
Library           FakerLibrary    locale=en_US
#https://faker.readthedocs.io/en/master/locales/en_US.html
Library           SeleniumLibrary
Library           ./Libraries/geradorCelular/geradorCelular.py
Library           OperatingSystem

*** Keywords ***
