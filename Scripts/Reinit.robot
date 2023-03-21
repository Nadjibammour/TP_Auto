*** Settings ***
Library             SeleniumLibrary
Library             DateTime
Library             String
Resource            ../Resources/keyword.robot
Variables           ../Resources/Locators.py

Suite Setup         Ouvrir le navigateur web
Suite Teardown      Close All Browsers
Test Template       Reinitialiser son mot de passe


*** Variables ***
${vURL}         http://tutorialsninja.com/demo/index.php?route=common/home
${vBrowser}     chrome


*** Test Cases ***
##### Precondition : Avoir deja un compte cree avec un email ############################

Test Reinitialiser Password    nadjib.ammour@gmail.com
