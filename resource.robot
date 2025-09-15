*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}          localhost:7272
${EVENT PAGE URL}  file:///C:/StarterFireLab10/Starterfiles/Lab10/Registration.html
${SUCCESS URL}     file:///C:/StarterFireLab10/Starterfiles/Lab10/Success.html
${BROWSER}         Firefox
${DELAY}           1

*** Keywords ***
Open Event Registration Page
    [Documentation]    เปิดหน้า Event Registration
    Open Browser    ${EVENT PAGE URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Page Should Contain    Event Registration

Input First Name
    [Arguments]    ${firstname}
    Input Text    id:firstname    ${firstname}

Input Last Name
    [Arguments]    ${lastname}
    Input Text    id:lastname    ${lastname}

Input Organization
    [Arguments]    ${organization}
    Input Text    id:organization    ${organization}

Input Email
    [Arguments]    ${email}
    Input Text    id:email    ${email}

Input Phone
    [Arguments]    ${phone}
    Input Text    id:phone    ${phone}

Click Register Button
    Click Button    id:registerButton

Verify Success Page
    [Documentation]    ตรวจสอบหน้า Success.html
    Location Should Contain    Success.html
    Title Should Be    Success