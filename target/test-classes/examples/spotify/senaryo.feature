Feature: Faz1-spotify
  Background:
    * configure driver = {type:'chromedriver' , executable:'src\\test\\java\\examples\\resources\\chromedriver.exe'}
  @SpotifyUI
  Scenario: Spotify login case
      Given driver 'https://open.spotify.com/'
      * maximize()
      When delay(3000)
      And click("//div[@class='ButtonInner-sc-14ud5tc-0 iebPZv encore-inverted-light-set']")
      And delay(3000)
      And input('#login-username','hayrettin.terzioglu@testinium.com')
      And delay(3000)
      And input('#login-password','testData')
      And delay(3000)
      And click('.ButtonInner-sc-14ud5tc-0.lbsIMA.encore-bright-accent-set')
      And delay(8000)
      And click('.Type__TypeElement-goli3j-0.eHCcSU.J4xXuqyaJnnwS6s2p3ZB.standalone-ellipsis-one-line')
      And delay(3000)
      And click('.Type__TypeElement-goli3j-0.hVBZRJ')
      And delay(3000)
      And input("//input[@class='f0GjZQZc4c_bKpqdyKbq JaGLdeBa2UaUMBT44vqI']",'MentorLabsChallenge')
      And delay(3000)
      And click('.ButtonInner-sc-14ud5tc-0.iebPZv.encore-inverted-light-set')
      And delay(3000)
      And input('.Type__TypeElement-goli3j-0.ebHsEf.l42JW4EP_5CU1Ba7jYIc','Daft Punk')
      And delay(3000)
      And click('button[data-testid=add-to-playlist-button]')
      And delay(3000)
