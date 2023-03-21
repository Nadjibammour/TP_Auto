*** Settings ***
Library             SeleniumLibrary
Library             DateTime
Library             String
Resource            ../Resources/keyword.robot
Variables           ../Resources/Locators.py

Suite Setup         Ouvrir le navigateur web
Suite Teardown      Logout et fermer le navigateur
Test Template       S'incrire en optant a la newlestter


*** Variables ***
${vURL}         http://tutorialsninja.com/demo/index.php?route=common/home
${vBrowser}     chrome


*** Test Cases ***
Test newsletter    claude    leroi    Test_logiciel_Robot@hotmail.com    514-442-3399    motdepasse1234
