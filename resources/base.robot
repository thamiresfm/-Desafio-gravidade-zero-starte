*Settings*
Library             Browser


Resource            actions.robot


*Keywords*
Start Session   
    New Browser      chromium        headless=False         slowMo=00:00:00
    New Page         https://nbank.vercel.app/


End Session
    Take Screenshot