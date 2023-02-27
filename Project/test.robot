*** Settings ***
Library    PuppeteerLibrary
Library    DebugLibrary

*** Test Cases ***
test Open
    &{options} =	create dictionary	headless=${False}
    Open Browser    https://the-internet.herokuapp.com/login    browser=chrome    options=${options}
    Wait Until Element Is Visible    xpath=//h2[normalize-space()='Login Page']
    Wait Until Element Is Visible    xpath=//input[@id='username']    
    Input Text    xpath=//input[@id='username']    clear=True    text=tomsmith
    Input Text    xpath=//input[@id='password']    text=SuperSecretPassword!    clear=true
    Run Async Keywords    Click Element    xpath=//i[@class='fa fa-2x fa-sign-in']    AND
    ...    Wait For Response Url    https://the-internet.herokuapp.com/secure 
    ${text}=    Get Text    xpath=//i[@class='icon-lock']
    Wait Until Element Is Visible    xpath=//i[@class='icon-2x icon-signout']
    Click Element    xpath=//i[@class='icon-2x icon-signout']
    Log To Console    ${text}

