*** Settings ***
Library             SeleniumLibrary
Library             DateTime
Library             String
Resource            ../Resources/keyword.robot
Variables           ../Resources/Locators.py

Suite Setup         Ouvrir le navigateur web
Suite Teardown      Close All Browsers
Test Template       S'inscrire avec un compte double


*** Variables ***
${vURL}         http://tutorialsninja.com/demo/index.php?route=common/home
${vBrowser}     chrome


*** Test Cases ***
Test 1 : inscription double    patrick    claude    test.inscriptionDouble@hotmail.com    438-333-4445    pass4566
