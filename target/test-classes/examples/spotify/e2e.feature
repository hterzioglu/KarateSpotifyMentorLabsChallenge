Feature: e2e
  Background:
    * configure driver = {type:'chromedriver' , executable:'src/test/java/examples/resources/chromedriver.exe'}
    * call read 'locator.json'

    * def id = '31444nwg4cu6zvxn2jdqaa5yp5dm'
    * def token = 'Bearer BQCFAA1W1yJRh94KI0sVMyF1SLrDfnStIu_T3RWtAeG2MB7d24Pf_paFtxXmufuhmghYsyBO-KtvVC2wwnQ6e-lncYLAbr7urq3GNCt5y_4rS4_vZd4V2JInet_0IM_EpXgWqktyz5uTxcwJdvTsAPK2i9IO_F7wX-kC68KXOv8po0gIrb01pI1L9_um-90c9432SH-LpkOe2ifZ6mu6bjhKndhibgJNi_RzHWARPKceRkKDZKv43tkg5jA9Vh6Z_B0FMf3qPXio8rsso6YfM0h8'
    Scenario: Spotify Challenge EndtoEnd Hybrid Senaryo
      Given driver 'https://open.spotify.com/'
      * maximize()
      And delay(1000)
      And match enabled('button[data-testid=login-button]') == true
      And print('Ana sayfa Basarili bir sekilde acıldi')
      #Ana sayfanın açıldıgı dogrulanır
      And delay(2000)
      * waitFor(login.firstOturumAc).click()
      * waitFor(login.oturumAc).click()
      And print('email ve şifre boş bırakıldıgı için giriş yapılamadı')
      #Invalid senaryo boş bırakıp login olma
      * input(login.userName, WrongEmail)
      * input(login.passWord, WrongPassword)
      * waitFor(login.oturumAc).click()
      And print('yanlış email veya şifre')
      #Invalid senaryo yanlış email, password ile giriş
      * clear('#login-username')
      * clear('#login-password')
      * input(login.userName, email)
      * input(login.passWord, password)
      * waitFor(login.oturumAc).click()

      #başarılı giriş yapma
      And match enabled('button[data-testid=user-widget-link]') == true
      And delay(2000)
      And print('basarılı bir sekilde giris yapildi')
      #başarılı giriş kontrolü
      * waitFor(search.searchButton).click()
      * input(search.searchBox, searchInput)
      * waitFor(favsong.sarkibegen).click()
      * waitFor(favsong.begenilensarkilar).click()
      # şarkı aratma ve begenilenlere ekleme
      And match text('.Type__TypeElement-goli3j-0.fCtMzo.t_yrXoUO3qGsJS4Y6iXX.standalone-ellipsis-one-line') == 'Kapısı Kapalı'
      And print('Şarkı Başarıyla Begenilen şarkılara eklendi')
      # begenilen şarkılara eklenme kontrolü
      * waitFor(favsong.sarkibegen).click()
      # begenilen şarkılardan çıkarma
      Given url 'https://api.spotify.com/v1'
      And path '/users/'+id+'/playlists'
      And header Authorization = token
      And request RequestBody2
      When method post
      Then status 201
      # API playlist oluşturma
      And refresh()
      * waitFor(playList.pickPlayList).click()
      * waitFor(playList.playlistSearch).click()
      * input(playList.playlistSearch, playlistInput)
      #playlist aramaya müzik kelimesi girip aratılır
      * waitFor(playList.addSong).click()
      And match text('.Type__TypeElement-goli3j-0.hHrtFe.rq2VQ5mb9SDAFWbBIUIn.standalone-ellipsis-one-line') == 'Emir Can İğrek'
      # Emircan İğrek müzik kutusu şarkısının eklendiği kontrol edilir
      And print('Şarkı başarıyla eklendi')
      * waitFor(playList.UçNokta).click()
      * waitFor(playList.goPlaylistRadio).click()
      #çalma listesi radyosuna gidilir
      * waitFor(playList.playWithRadio).click()
      #çalma listesi radyosundan play tusuna basılır
      And delay(8000)
      * waitFor(playList.stopPlay).click()
      #şarkı durdurulur
      * waitFor(kitaplik.tiklaKitaplik).click()
      * waitFor(kitaplik.goPodcast).click()
      * waitFor(kitaplik.hepsiniGor).click()
      * waitFor(kitaplik.podcastClick).click()
      * waitFor(kitaplik.episodeClick).click()
      * waitFor(kitaplik.playPodcast).click()
      And delay(3000)
      * waitFor(kitaplik.stopPodcast).click()
      * waitFor(logout.clickProfile).click()
      * waitFor(logout.clickLogout).click()
      And delay(10000)










