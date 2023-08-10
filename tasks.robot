*** Settings ***
Library    RPA.Calendar
Library    DateTime
Library    RPA.Robocorp.Vault
Library    RPA.Robocorp.Process

*** Tasks ***
Run process on the first business day
    ${is_today_the_day}=   Check if today is the first business day of the month
    Run Keyword If    '${is_today_the_day}' == 'Yes'
    ...    Trigger the main process

*** Keywords ***
Check if today is the first business day of the month
    ${today}=    Get Current Date    result_format=%Y-%m-%d
    # For testing purposes you can set the current day to be the first 
    # business day by uncommenting the following line:
    #${today}=    Set Variable    2023-08-01
    ${first_business_day}=  First Business Day of the Month  ${today}   
    IF    '${today}' == '${first_business_day}'
        ${is_today_the_day}   Set Variable   Yes
    ELSE
        ${is_today_the_day}   Set Variable   No
    END
    [Return]   ${is_today_the_day}

Trigger the main process
    ${secrets}=  Get Secret  ProcessAPI
    Set Credentials
    ...   ${secrets}[workspace_id]
    ...   ${secrets}[process_id]
    ...   ${secrets}[apikey]
    Start Process