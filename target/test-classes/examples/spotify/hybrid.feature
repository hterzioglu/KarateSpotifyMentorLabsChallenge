Feature: Spotify Automation
  Background:
    * configure driver = {type:'chromedriver' , executable:'src/test/java/examples/resources/chromedriver.exe'}
    * def matchUri = 'spotify:track:3MrRksHupTVEQ7YbA0FsZK'
    * call read 'locator.json'
    * def id = '31444nwg4cu6zvxn2jdqaa5yp5dm'
    * def token = 'Bearer BQBJmAzuD-hkf_7EYxoBjpQGc7dBIRSmRr5ZzDa6OqaHNuPOsyl6CGXj1ZwARmWgrs725YFUB386m2fNNuXTmm7Gwe0YwXvkGiTyxswIdhoyMfkJZs0X_0KH2QChBde5XUw9IMJE-Fy7Sin958pR0plPcFJL3obZdAZ9G0RMkcwYpDpIDmrcRyFMOOhKqfeJ0KuNGdD3brM2cpf669PM0SPUDU1ZpwuJRYkK5rL37a0z-YKlTyH_JQTk-sBKEMN_sZdEtDnZjc82b1pwoETfXu18mg'
    * def requestUri =
  """
  {
  "uris": [
  "spotify:track:3MrRksHupTVEQ7YbA0FsZK"
  ],
  "position": 0
  }'
    """



  Scenario: Spotify Hybrid Automation
    Given driver 'https://open.spotify.com/'
    * maximize()
    * click(login.firstOturumAc)
    * input(login.userName, email)
    * input(login.passWord, password)
    * click(login.oturumAc)
    Given url 'https://api.spotify.com/v1'
    And path '/users/'+id+'/playlists'
    And header Authorization = token
    And request RequestBody
    When method post
    Then status 201
    And def pLid = response.id
    And path '/playlists/'+pLid+'/tracks'
    And header Authorization = token
    And header Content-Type = 'application/json'
    And request requestUri
    When method post
    Then status 201
    * click(playList.pickPlayList)
    * click(playList.playSong)
    And delay(7000)
    And match enabled('.Type__TypeElement-goli3j-0.ebHsEf') == true
    And delay(3000)


