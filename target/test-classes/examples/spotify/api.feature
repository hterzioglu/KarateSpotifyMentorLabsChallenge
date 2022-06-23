Feature: Spotify Api Test
  Background:
    * def id = '31444nwg4cu6zvxn2jdqaa5yp5dm'
    * def token = 'Bearer BQAtxBHQpmGycSan50jAWXAg-1AfenlXYtvx_OHZXkoN7X5JeVySiR71hxZqvvr23G9bpAc1VBno_3l7EGsbfypI8Q2Rq3OfpbnV71V1Bw5lGdpy--VKJeu_O7GMXfKiQl1K0XJ8XMv44OaFJtXERn3d4fG48tMSM5SvDGQlR0zH3Ac4RaF6awD25zZo2KiN6T9D1C5uv62fCxNz0bFTZhbV4FooISRC_zEf59wFOFQk4c3SWWDN-UKrAGBOBRPHmHpQ0xtiz05jzzzvp0j_xol5PQ'
    * def requestBody =
  """
  {
  "name": "NewPlayListChallengeSarkıEklemeDeneme",
  "description": "New playlist success yeni token deneme",
  "public": false
  }  """
* def requestUri =
  """
  {
  "uris": [
  "spotify:track:4u7EnebtmKWzUH433cf5Qv"
  ],
  "position": 0
  }'
    """
 @GET
  Scenario: GetMethodu
    Given url 'https://api.spotify.com/v1'
    And path '/me'
    And header Authorization = token
    When method get
    Then status 200

   @PostPL
    Scenario: CreatePlayList
      Given url 'https://api.spotify.com/v1'
      And path '/users/'+id+'/playlists'
      And header Authorization = token
      And request requestBody
      When method post
     Then status 201
     And def pLid = response.id



     @Search
      Scenario: SpotifySearch
        Given url 'https://api.spotify.com/v1'
        And path '/search'
        And header Authorization = token
        And header Content-Type = 'application/json'
        And param q = 'track:Bohemian Rhapsody'
        And param type = 'track'
        When method get
        Then status 200

       @AddSong
  Scenario: AddPlayListItem
    * def callMethod = call read('api.feature@PostPL')
         * def playlistid = callMethod.pLid
         Given url 'https://api.spotify.com/v1'
    And path '/playlists/'+playlistid+'/tracks'
    And header Authorization = token
    And header Content-Type = 'application/json'
    And request requestUri
    When method post



        




