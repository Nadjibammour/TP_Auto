*** Settings ***
Library             SeleniumLibrary
Library             DateTime
Library             String
Resource            ../Resources/keyword.robot
Variables           ../Resources/Locators.py

Suite Setup         Ouvrir le navigateur web
Suite Teardown      Close All Browsers
Test Template       Utilisateur peut passer une commande


*** Variables ***
${vURL}         http://tutorialsninja.com/demo/index.php?route=common/home
${vBrowser}     chrome


*** Test Cases ***
Commande ipod    iPod Nano    guest    test    guest.test@hotmail.com    438-226-4253    rue saint zotique    Montréal    h1y1c6    Canada    Québec
