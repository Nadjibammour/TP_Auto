*** Settings ***
Library         SeleniumLibrary
Library         DateTime
Library         String
Library         XML
Variables       ../Resources/Locators.py


*** Variables ***
${TIMEOUT}      5s
${vURL}         http://tutorialsninja.com/demo/index.php?route=common/home
${vBrowser}     chrome
${vUsername}
${vPassword}


*** Keywords ***
Ouvrir le navigateur web
    Open Browser    ${vURL}    ${vBrowser}
    Maximize Browser Window

Logout et fermer le navigateur
    Click Element    ${lnk_MyAccount}
    Sleep    2
    Click Element    ${lnk_logout}
    Close All Browsers

S'inscrire en fournissant tous les champs
    [Arguments]    ${FIRST_NAME}    ${LAST_NAME}    ${EMAIL}    ${TELEPHONE}    ${PASSWORD}
    Click Element    ${lnk_MyAccount}
    Click Element    ${lnk_Register}
    Input Text    ${txt_firstname}    ${FIRST_NAME}
    Input Text    ${txt_last_name}    ${LAST_NAME}
    Input Text    ${txt_email}    ${EMAIL}
    Input Text    ${txt_telephone}    ${TELEPHONE}
    Input Text    ${txt_password}    ${PASSWORD}
    Input Text    ${txt_Confirme_password}    ${PASSWORD}
    Click Element    ${btn_agree}
    Click Button    ${btn_submit}
    Sleep    2
    Page Should Contain    Your Account Has Been Created!

S'incrire en optant a la newlestter
    [Arguments]    ${FIRST_NAME}    ${LAST_NAME}    ${EMAIL}    ${TELEPHONE}    ${PASSWORD}
    Click Element    ${lnk_MyAccount}
    Click Element    ${lnk_Register}
    Input Text    ${txt_firstname}    ${FIRST_NAME}
    Input Text    ${txt_last_name}    ${LAST_NAME}
    Input Text    ${txt_email}    ${EMAIL}
    Input Text    ${txt_telephone}    ${TELEPHONE}
    Input Text    ${txt_password}    ${PASSWORD}
    Input Text    ${txt_Confirme_password}    ${PASSWORD}
    Select Radio Button    newsletter    1
    Click Element    ${btn_agree}
    Click Button    ${btn_submit}
    Sleep    2
    Page Should Contain    Your Account Has Been Created!

S'inscrire avec un compte double
    [Arguments]    ${FIRST_NAME}    ${LAST_NAME}    ${EMAIL}    ${TELEPHONE}    ${PASSWORD}
    #Precondition s'inscrire une premiere fois
    Click Element    ${lnk_MyAccount}
    Click Element    ${lnk_Register}
    Input Text    ${txt_firstname}    ${FIRST_NAME}
    Input Text    ${txt_last_name}    ${LAST_NAME}
    Input Text    ${txt_email}    ${EMAIL}
    Input Text    ${txt_telephone}    ${TELEPHONE}
    Input Text    ${txt_password}    ${PASSWORD}
    Input Text    ${txt_Confirme_password}    ${PASSWORD}
    Click Element    ${btn_agree}
    Click Button    ${btn_submit}
    Sleep    5
    Page Should Contain    Your Account Has Been Created!

    #Se deconnecter
    Click Element    ${lnk_MyAccount}
    Click Element    ${lnk_logout}

    #S'inscrire avec les meme information
    Click Element    ${lnk_MyAccount}
    Click Element    ${lnk_Register}
    Input Text    ${txt_firstname}    ${FIRST_NAME}
    Input Text    ${txt_last_name}    ${LAST_NAME}
    Input Text    ${txt_email}    ${EMAIL}
    Input Text    ${txt_telephone}    ${TELEPHONE}
    Input Text    ${txt_password}    ${PASSWORD}
    Input Text    ${txt_Confirme_password}    ${PASSWORD}
    Click Element    ${btn_agree}
    Click Button    ${btn_submit}
    Page Should Contain    Warning: E-Mail Address is already registered!

Se connecter avec des informations valides
    [Arguments]    ${Email}    ${Password}
    Click Element    ${lnk_MyAccount}
    Click Element    ${lnk_login}
    Input Text    ${text_email}    ${Email}
    Input Text    ${text_password}    ${Password}
    Click Button    ${btn_login}
    Page Should Contain    My Account

Reinitialiser son mot de passe
    [Arguments]    ${EMAIL}
    Click Element    ${lnk_MyAccount}
    Click Element    ${lnk_login}
    Click Element    ${lnk_ForgetPass}
    Page Should Contain    Forgot Your Password?
    Input Text    ${lnk_email_forget}    ${EMAIL}
    Click Button    ${lnk_continuer}
    Sleep    3
    Page Should Contain    An email with a confirmation link has been sent your email address.

Rechercher des produits sur le Suite
    [Arguments]    ${MOT_CLES}
    Input Text    ${txt_search}    ${MOT_CLES}
    Click Button    ${btn_search}
    Page Should Contain    Search - ${MOT_CLES}

Utilisateur informe quand produit non disponible
    [Arguments]    ${MOT_CLES}
    Input Text    ${txt_search}    ${MOT_CLES}
    Click Button    ${btn_search}
    Page Should Contain    Search - ${MOT_CLES}
    Page Should Contain    There is no product that matches the search criteria.

Utilisateur peut passer une commande
    [Arguments]    ${MOT_CLES}    ${FIRST_NAME}    ${LAST_NAME}    ${EMAIL}    ${PHONE}    ${ADDRESS}    ${CITY}    ${POSTCODE}    ${COUNTRY}    ${REGION}
    Input Text    ${txt_search}    ${MOT_CLES}
    Click Button    ${btn_search}
    Page Should Contain    Search - ${MOT_CLES}
    Click Element    ${lnk_product_find}
    Click Button    ${lnk_add_to_card}
    Sleep    2
    Click Element    ${lnk_checkout}
    Sleep    2
    Click Element    ${lnk_guest}
    Click Element    ${lnk_continue}
    Sleep    2
    Input Text    ${lnk_firstName}    ${FIRST_NAME}
    Input Text    ${lnk_lastName}    ${LAST_NAME}
    Input Text    ${lnk_Email}    ${EMAIL}
    Input Text    ${lnk_tel}    ${PHONE}
    Input Text    ${lnk_adress}    ${ADDRESS}
    Input Text    ${lnk_city}    ${CITY}
    Input Text    ${lnk_code}    ${POSTCODE}
    Select From List By Label    ${lnk_country}    ${COUNTRY}
    Select From List By Label    ${lnk_region}    ${REGION}
    Click Button    ${btn_continuer}
    Click Element    ${lnk_term_condition}
    Click Button    ${btn_continuerPayment}
