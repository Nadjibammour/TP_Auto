*** Settings ***
Library             SeleniumLibrary
Library             DateTime
Library             String
Resource            ../Resources/keyword.robot
Variables           ../Resources/Locators.py

Suite Setup         Ouvrir le navigateur web
Suite Teardown      Logout et fermer le navigateur
Test Template       Se connecter avec des informations valides


*** Variables ***
${vURL}         http://tutorialsninja.com/demo/index.php?route=common/home
${vBrowser}     chrome
${EMAIL}        nadjib.ammour@gmail.com
${PASSWORD}     12345678


*** Test Cases ***    Email    Password
Test 1(Connexion)    ${EMAIL}    ${PASSWORD}
