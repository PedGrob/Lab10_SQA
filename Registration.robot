*** Settings ***
Documentation     ทดสอบการลงทะเบียนสำเร็จ (Happy Path Scenarios)
Resource          resource.robot
Test Setup        Open Event Registration Page  # <-- Setup: เปิดเบราว์เซอร์ก่อนเริ่มทุกเทสต์
Test Teardown     Close Browser                 # <-- Teardown: ปิดเบราว์เซอร์หลังจบทุกเทสต์

*** Variables ***
# --- จัดเก็บข้อมูลทดสอบไว้ที่ส่วนกลาง ---
${VALID_FIRST_NAME}    Somsri
${VALID_LAST_NAME}     Sodsai
${VALID_EMAIL}         somsri@kkumail.com
${VALID_PHONE}         081-001-1234
${VALID_ORG}           CS KKU

*** Test Cases ***
Register Success With All Information
    [Documentation]    ทดสอบลงทะเบียนสำเร็จโดยกรอกข้อมูลครบทุกช่อง
    [Tags]    Happy Path

    Input First Name    ${VALID_FIRST_NAME}
    Input Last Name     ${VALID_LAST_NAME}
    Input Organization  ${VALID_ORG}
    Input Email         ${VALID_EMAIL}
    Input Phone         ${VALID_PHONE}
    Click Register Button
    Verify Success Page

Register Success Without Optional Organization
    [Documentation]    ทดสอบลงทะเบียนสำเร็จโดยไม่กรอกข้อมูลหน่วยงาน (Optional)
    [Tags]    Happy Path

    Input First Name    ${VALID_FIRST_NAME}
    Input Last Name     ${VALID_LAST_NAME}
    Input Email         ${VALID_EMAIL}
    Input Phone         ${VALID_PHONE}
    Click Register Button
    Verify Success Page