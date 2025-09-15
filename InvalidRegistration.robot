*** Settings ***
Documentation     ทดสอบการลงทะเบียนที่ผิดพลาด (Negative Scenarios)
Resource          resource.robot
Test Setup        Open Event Registration Page  # <-- Setup: เปิดเบราว์เซอร์ก่อนเริ่มทุกเทสต์
Test Teardown     Close Browser                 # <-- Teardown: ปิดเบราว์เซอร์หลังจบทุกเทสต์

*** Variables ***
# --- จัดเก็บข้อมูลทดสอบไว้ที่ส่วนกลาง ---
${VALID_FIRST_NAME}    Somsri
${VALID_LAST_NAME}     Sodsai
${VALID_EMAIL}         somsri@kkumail.com
${VALID_PHONE}         081-001-1234
${INVALID_PHONE}       1234
${VALID_ORG}           CS KKU

*** Test Cases ***
Register Fails With Empty First Name
    [Documentation]    ทดสอบเมื่อไม่กรอกชื่อจริง
    [Tags]    Negative

    Input Last Name     ${VALID_LAST_NAME}
    Input Organization  ${VALID_ORG}
    Input Email         ${VALID_EMAIL}
    Input Phone         ${VALID_PHONE}
    Click Register Button
    Element Text Should Be    id:errors    *Please enter your first name!!

Register Fails With Empty Last Name
    [Documentation]    ทดสอบเมื่อไม่กรอกนามสกุล
    [Tags]    Negative

    Input First Name    ${VALID_FIRST_NAME}
    Input Organization  ${VALID_ORG}
    Input Email         ${VALID_EMAIL}
    Input Phone         ${VALID_PHONE}
    Click Register Button
    Element Text Should Be    id:errors    *Please enter your last name!!
	
Register Fails With Empty First Name and Last Name
    [Documentation]    ทดสอบเมื่อไม่กรอกชื่อและนามสกุล
    [Tags]    Negative

    Input Organization  ${VALID_ORG}
    Input Email         ${VALID_EMAIL}
    Input Phone         ${VALID_PHONE}
    Click Register Button
    Element Text Should Be    id:errors    *Please enter your name!!

Register Fails With Empty Email
    [Documentation]    ทดสอบเมื่อไม่กรอกอีเมล
    [Tags]    Negative

    Input First Name    ${VALID_FIRST_NAME}
    Input Last Name     ${VALID_LAST_NAME}
    Input Organization  ${VALID_ORG}
    Input Phone         ${VALID_PHONE}
    Click Register Button
    Element Text Should Be    id:errors    *Please enter your email!!

Register Fails With Invalid Phone Number
    [Documentation]    ทดสอบเมื่อกรอกเบอร์โทรศัพท์ผิดรูปแบบ
    [Tags]    Negative

    Input First Name    ${VALID_FIRST_NAME}
    Input Last Name     ${VALID_LAST_NAME}
    Input Organization  ${VALID_ORG}
    Input Email         ${VALID_EMAIL}
    Input Phone         ${INVALID_PHONE}
    Click Register Button
    Element Text Should Be    id:errors    *Please enter a valid phone number , e.g., 081-234-5678, 081 234 5678, or 081.234.5678