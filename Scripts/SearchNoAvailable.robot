*** Settings ***
Library             SeleniumLibrary
Library             DateTime
Library             String
Resource            ../Resources/keyword.robot
Variables           ../Resources/Locators.py

Suite Setup         Ouvrir le navigateur web
Suite Teardown      Close All Browsers
Test Template       Utilisateur informe quand produit non disponible


*** Variables ***
${vURL}         http://tutorialsninja.com/demo/index.php?route=common/home
${vBrowser}     chrome


*** Test Cases ***
test 1 : Recherche de produit non disponible    samsung88888
test 2 : Recherche de produit non disponible    iphone33344