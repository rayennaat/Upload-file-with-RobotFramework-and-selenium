*** Settings ***
Library    SeleniumLibrary     #plugins=${CURDIR}/../src/SeleniumTestability;True;29 seconds;False
Library    OperatingSystem
Library    Screenshot
Library    Collections
Library    Process
Library    XML

*** Variables ***
${url}    https://practice.expandtesting.com/upload
${browser}    Chrome


*** Test Cases ***
Upload
    Open
    Test_upload_file

*** Keywords ***
Open
    Open Browser    ${url}  ${browser}
    Maximize Browser Window
    Sleep    2s

Test_upload_file
    [Tags]      file
    Wait Until Element Is Visible    xpath-of-your-input-file    10
    Wait Until Element Is Visible    id-of-the-button-submit    10
    
    Log    ${CURDIR}
    ${file_path}   Set Variable    ${CURDIR}/../path/to/your/file
    ${file_path}    Normalize Path    ${file_path}

    Choose File    xpath-of-your-input-file    ${file_path}
    Sleep    2s
    Click Element    id-of-the-button-submit
    sleep   2s


