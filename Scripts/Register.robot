*** Settings ***
Library             SeleniumLibrary
Library             DateTime
Library             String
Resource            ../Resources/keyword.robot
Variables           ../Resources/Locators.py

Suite Setup         Ouvrir le navigateur web
Suite Teardown      Logout et fermer le navigateur
Test Template       S'inscrire en fournissant tous les champs


*** Variables ***
${vURL}         http://tutorialsninja.com/demo/index.php?route=common/home
${vBrowser}     chrome


*** Test Cases ***
Test 1    Gorge    lincon    test_logiciel14@hotmail.com    439-223-4445    password123456
