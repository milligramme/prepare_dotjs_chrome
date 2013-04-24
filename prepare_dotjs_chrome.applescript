tell application "Google Chrome"
  activate
  
  close every window
  set localhost to "https://localhost:3131" as string
    
  set prepare_dotjs to make new window with properties {mode:"normal", bounds:[0,0,640,480]}
  tell prepare_dotjs
    
    set ssltab to make new tab with properties {URL:localhost}
    activate tab
    tell ssltab
      repeat
        set current_status to loading
        if current_status = false then exit repeat
        delay 3
      end repeat
    end tell

    -- require cliclick <http://www.bluem.net/de/mac/cliclick/>
    do shell script "/usr/local/bin/cliclick -m verbose c:190,440"
    do shell script "/usr/local/bin/cliclick -m verbose c:190,456" -- if bookmarks bar shown
    
    -- // dotjs is working! //
  end tell
end tell